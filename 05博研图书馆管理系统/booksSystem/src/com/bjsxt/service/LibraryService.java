package com.bjsxt.service;

import com.bjsxt.entity.Library;

public interface LibraryService {
	Library findLibrary();

	int modifyLibrary(Library library);
}
