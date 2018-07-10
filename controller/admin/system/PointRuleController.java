package net.sppan.base.controller.admin.system;

import net.sppan.base.common.JsonResult;
import net.sppan.base.controller.BaseController;
import net.sppan.base.entity.PointRule;
import net.sppan.base.service.IPointRuleService;
import net.sppan.base.service.specification.SimpleSpecificationBuilder;
import net.sppan.base.service.specification.SpecificationOperator.Operator;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin/pointrule")
public class PointRuleController extends BaseController {
	@Autowired
	private IPointRuleService pointRuleService;
	

	@RequestMapping("/index")
	public String index() {
		return "admin/pointrule/index";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<PointRule> list() {
		SimpleSpecificationBuilder<PointRule> builder = new SimpleSpecificationBuilder<PointRule>();
		String searchText = request.getParameter("searchText");
		if(StringUtils.isNotBlank(searchText)){
			builder.add("name", Operator.likeAll.name(), searchText);
		}
		Page<PointRule> page = pointRuleService.findAll(builder.generateSpecification(),getPageRequest());
		return page;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap map) {
		List<PointRule> list = pointRuleService.findAll();
		map.put("list", list);
		return "admin/pointrule/form";
	}
	

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable Integer id,ModelMap map) {
		PointRule pointRule = pointRuleService.find(id);
		map.put("pointrule", pointRule);
		
		List<PointRule> list = pointRuleService.findAll();
		map.put("list", list);
		return "admin/pointrule/form";
	}
	
	@RequestMapping(value= {"/edit"}, method = RequestMethod.POST)
	@ResponseBody
	public JsonResult edit(PointRule pointrule,ModelMap map){
		try {
			pointRuleService.saveOrUpdate(pointrule);
		} catch (Exception e) {
			return JsonResult.failure(e.getMessage());
		}
		return JsonResult.success();
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult delete(@PathVariable Integer id,ModelMap map) {
		try {
			pointRuleService.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonResult.failure(e.getMessage());
		}
		return JsonResult.success();
	}
}
