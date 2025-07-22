package com.paradise.videolibrary.api.dto;

import lombok.*;

@Value
@Builder
public class EmailDetails {

    String recipient;
    String msgBody;
    String subject;
    String attachment;
}
