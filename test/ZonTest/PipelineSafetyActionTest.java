package ZonTest;

import com.htcf.action.BaseAction;
import com.htcf.entity.ThysyywWgcbEntity;
import com.htcf.service.PipelineSafetyService;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

/**
 * @author by hj on 2017-12-19.
 */
public class PipelineSafetyActionTest extends BaseAction {

    private ThysyywWgcbEntity wgcbEntity;
    String xzsj=this.getDateTime();

    private static  PipelineSafetyService wg = null;
    @BeforeClass
    public static void iniUserService(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("/config/beans.xml");
        wg = (PipelineSafetyService) ac.getBean("safetyService");
    }
    @Test
    public void saveWgcb() throws Exception {
        wgcbEntity.setAddtime(xzsj);
        wg.saveWgcbInfo(wgcbEntity);


    }


}