package com.htcf.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htcf.dao.DictionaryDao;
import com.htcf.dao.HysyywHyflfgDao;
import com.htcf.entity.Dictionary;
import com.htcf.entity.HysyywHyflfg;
import com.htcf.service.HysyywHyflfgService;
import com.htcf.util.PageBean;

@Service("lawService")
public class HysyywHyflfgServiceImpl implements HysyywHyflfgService {

	@Autowired
	private HysyywHyflfgDao lawDao;
	@Autowired
	private DictionaryDao dictionaryDao;
	
	public boolean addLaw(HysyywHyflfg law) {
		return lawDao.saveLaw(law);
	}

	public boolean editLaw(HysyywHyflfg law) {
		return lawDao.updateLaw(law);
	}

	public HysyywHyflfg loadLawById(HysyywHyflfg law) {
		return lawDao.fetchLawById(law);
	}

	public List<HysyywHyflfg> loadLawPage(HysyywHyflfg law, PageBean pageBean) {
		return lawDao.fetchLawPage(law, pageBean);
	}

	public boolean removeLawById(HysyywHyflfg law) {
		return lawDao.delLawById(law);
	}

	public List<Dictionary> loadDicByKey(Dictionary dictionary) {
		return dictionaryDao.loadDicByKey(dictionary);
	}

	public Map<String, String> loadDicMapByKey(Dictionary dictionary) {
		return dictionaryDao.loadDicMapByKey(dictionary);
	}

	public Map<String, String> loadValByKeyAndDm(Dictionary dictionary) {
		return dictionaryDao.loadValByKeyAndDm(dictionary);
	}

}
