package com.suim.event.model.service;

import com.suim.event.model.vo.Eattachment;
import com.suim.event.model.vo.Event;

public interface AdminEventService {

	int insertEventBoard(Event e, Eattachment eAttach);

	int insertEventFile(Eattachment eAttach);

	int updateEvent(Event e);

	int deleteEvent(int eno);


}
