package onepercentbg;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kongzhong.gw2.onepercentbg.domain.HlgLiBao;
import com.kongzhong.gw2.onepercentbg.domain.Page;
import com.kongzhong.gw2.onepercentbg.mapper.HlgLiBaoMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml" })
public class MapperTest {
	
	@Autowired
	private HlgLiBaoMapper mapper;
	
	@Test
	public void test1(){
		
		/*HlgLiBao hlgLiBao=new HlgLiBao();
		hlgLiBao.setId(56);
		hlgLiBao.setName("激战2asdsds");
		hlgLiBao.setStartTime("2015-10-14 10:31:23");
		hlgLiBao.setEndTime("2016-10-20 10:31:23");
		hlgLiBao.setPrize(2514);
		hlgLiBao.setGiftId(25142);
		hlgLiBao.setType(1);
		
		mapper.updateLiBao(hlgLiBao);*/
		
	}
}
