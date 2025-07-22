package com.paradise.videolibrary.api.mail;

import com.paradise.videolibrary.api.dto.EmailDetails;

public interface EmailService {

    String sendSimpleMail(EmailDetails details);

    String sendMailWithAttachment(EmailDetails details);
}
