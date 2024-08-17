Return-Path: <SRS0=OkV+=PR=gmail.com=izzyguestposting@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC838C52D7C
	for <linux-firmware@archiver.kernel.org>; Sun, 18 Aug 2024 06:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60F71C4AF09; Sun, 18 Aug 2024 06:12:06 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F82FC32786;
	Sun, 18 Aug 2024 06:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F82FC32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5b5b67d0024so4059414a12.0;
        Sat, 17 Aug 2024 23:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723961523; x=1724566323; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BsJBPBEoAWSSswQwJB4Ml+ENi0rq4FXQPgeWpRf0C2U=;
        b=mdgg01XMBPrmpRk4rqWfwin/3ZPpYv4wxF8XlrZ8y5yr0wD8l2udnCWVv5uUWvA37B
         4Now+oJE6Fbu0lMhmDgNA8rPNH6pUMWli1cGhRr6xy2d/Cd+khRPW8+TYEiGLM4dw8em
         50DSBJrDusw8jNxycwEkwXJMkg9AO6nFch8m57B4NCsdeLnOKZ9DMFE3LAF9iP11JZOl
         EOujrDIeCy9eZGyYF5YI1isrrDGF2BsaPdoqGqDakGquK0Vf1Bw3m8nV9bNiIMtLQCzX
         H5MUCCTzI1q6zzUbEpef+UhBGe5dImjUk6YQSXeNdXsU2u8Qo/9UxCjUYVVjZXk/a2T5
         tI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723961523; x=1724566323;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BsJBPBEoAWSSswQwJB4Ml+ENi0rq4FXQPgeWpRf0C2U=;
        b=qgV6eB4SVEpIGSh/6FVXeVRV9p14LhmpANROOwbwpi1pUHutLQDt94wUELOP1fUhA8
         18z3/JggkZskmmTYQHL3uR9R5v1MZ0DlBPeQWcsgLrh9Wd8+oqqmRsoO4Kla/tzw/0fA
         Frb1SVXbsVxduSTy9x4pvGwxEuThKkUbPYODxWwV8UBSyvWHHa/sHUCR9sCR9bpFWpQ4
         1LoibKGijilu30wFQBqoFNwO22SvgfsHcx6pH7np/4rsuz3Ng1enV/ivQo7YLAtn3plC
         n8W5/m8V9lAiFJyb3J0w1ZDaymxIlgq91ARp+ENB/9Lt1/pUZmpI4RP7QrKMVf7YIs3i
         D7OQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9fVzsAj9saoexu0t9FS/db4+1d0dVm7stkEu1UIMq8w1Cd+//qOALN8BPOSCj3dzsx0Z5JCbl4AARAhIv2w==@kernel.org, AJvYcCUKBMEYdPip+ezx2nItCe10nHKXZSjNgonIrq7rcjUQI8BxxHw3znOQEz99AznTovSoz1W1r+g=@kernel.org, AJvYcCVahmHr+UH1IEJM5NLmMAGcfZclf69VrKcT1Dh9gp4GfQfIDD/VY7/1GOYI+1JubPPDkTAgNPgd@kernel.org
X-Gm-Message-State: AOJu0Ywcy2w0bLb+PsuGrZampQwn9lNIv4MnkUdmsazhuw3bOWmAa5Fz
	fnBvM2a+17qAJHytox9/ZMQ5hnnIIMQs8Boq60e2GM4xU64oBKQK57x8baY7nHwvAj/U0gyJLEf
	5W4TGn9JD1ciTTEHJ7bmR2kpad2lyHV52
X-Google-Smtp-Source: AGHT+IHwOw21rZMbBcSSjBSxD1xoO1/FX3lsdD4skiA2AdLT0ol+DZ6h4TJMi3mO88ggxbDpFg5MTht99+LY25lj0Uc=
X-Received: by 2002:a05:6402:348b:b0:5be:e999:18ab with SMTP id
 4fb4d7f45d1cf-5bee9991c77mr1766467a12.23.1723961523178; Sat, 17 Aug 2024
 23:12:03 -0700 (PDT)
MIME-Version: 1.0
From: Izzy guestposting <izzyguestposting@gmail.com>
Date: Sat, 17 Aug 2024 22:46:56 +0500
Message-ID: <CAOuACa7KLj-PvraR0U9BZHFRztygvAChfcA7_oL4WtqtSOO_=w@mail.gmail.com>
Subject: Paid Guest Post Inquiry
List-Id: <linux-firmware.lore.kernel.org>
To: security@kernel.org, linux-firmware@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, stable@kernel.org
Content-Type: multipart/alternative; boundary="0000000000003210c5061fef1240"

--0000000000003210c5061fef1240
Content-Type: text/plain; charset="UTF-8"

 Dear Admin
I hope this message finds you well. My name is Hasnain Ali. I am reaching
out to inquire about the possibility of paid Guest posting opportunities on
your esteemed website.

Could you please provide us with more information regarding your guest
posting guidelines, including any fees associated with publishing content
on your website? Additionally, if you have any specific requirements or
preferences for guest posts, we would be happy to accommodate them.

Thank you for considering our proposal. We look forward to the opportunity
to collaborate with you and contribute to your platform.

Best regards

*Hasnain Ali*
*Guest Blogger*

--0000000000003210c5061fef1240
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr"><div dir="ltr">
<span style="font-size:12.8px">Dear Admin</span><div dir="auto" style="font-size:12.8px">I
 hope this message finds you well. My name is Hasnain Ali. I am reaching
 out to inquire about the possibility of paid Guest posting 
opportunities on your esteemed website.</div><div dir="auto" style="font-size:12.8px"><br></div><div dir="auto" style="font-size:12.8px">Could
 you please provide us with more information regarding your guest 
posting guidelines, including any fees associated with publishing 
content on your website? Additionally, if you have any specific 
requirements or preferences for guest posts, we would be happy to 
accommodate them.</div><div dir="auto" style="font-size:12.8px"><br></div><div dir="auto" style="font-size:12.8px">Thank
 you for considering our proposal. We look forward to the opportunity to
 collaborate with you and contribute to your platform.</div><div dir="auto" style="font-size:12.8px"><br></div><div dir="auto" style="font-size:12.8px">Best regards</div><br></div></div>
<div><div dir="ltr" class="gmail_signature" data-smartmail="gmail_signature"><div dir="ltr"><div><b><i>Hasnain Ali</i></b></div><div><i>Guest Blogger</i><b><i><br></i></b></div></div></div></div></div>

--0000000000003210c5061fef1240--
