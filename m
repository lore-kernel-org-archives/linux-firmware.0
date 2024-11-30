Return-Path: <SRS0=sKH9=SZ=gmail.com=viralabhibusiness@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CFDD735F5
	for <linux-firmware@archiver.kernel.org>; Sat, 30 Nov 2024 08:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9F020C4CED3; Sat, 30 Nov 2024 08:01:23 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6713C4CECC
	for <linux-firmware@kernel.org>; Sat, 30 Nov 2024 08:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A6713C4CECC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a736518eso29316575e9.1
        for <linux-firmware@kernel.org>; Sat, 30 Nov 2024 00:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732953681; x=1733558481; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jq4Kg51eewlYfgjDtcuCuZbOHVxfvL1nZmif1BSNoKM=;
        b=TX24x2t8DCoXAWuRLpk2gGtbMtNR0jdr9I96iH4JUt6layvKviV+O4xn3q0XyQRNN6
         1O10UutaAxHkGCBseUP1hpGdvlhwimj9ypRUTaheYub1M8GTmJ2Dj2rQngb/y/mTtmW3
         XQDWf/scTdG0A1aktmAfdmYAXMpXCOcVwoLkyopq5jsmmGtxouwgcM8flplm9i475Uf5
         pGtTuSl/aXsbo5DEe7j4H3+e4VBUPz9gfGy/LhdlIyMDfFbHP+YKGruCb2a0Wcyo2QP3
         0ldjYUjkCvN1QnTnrX9S+TlDVo7PQSv0tOR1Li7CBUwZ3ZIO97qVcUrqnRZZL0V8A2By
         GIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732953681; x=1733558481;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jq4Kg51eewlYfgjDtcuCuZbOHVxfvL1nZmif1BSNoKM=;
        b=NHdDH64AVDx65c3WAWjE7WVoy3Q1/UoUvO9qj9uUUTPzOVcd3tYSl0nhxdJ3+pR3WQ
         FDZ7acb/bv/qDtFCRMdYE2d6r9MrqjO42UTIIQ/QaenyRayePn7DdR0Z/pTubkpVXMjD
         ug9L8hn9rhRT9MsSHspRInAIfxHz0m5J5GrS+kNFOjBKl51EzhHaNYoQ6Gl3z+hP8AM5
         Rnmt1RdEfVCKZOMATjIHiONXgNfC8pX0NW37WII7Jtfc6O5fp4Ungm1Znf9TsIv3uFa4
         tdMowtPKQosknzBj9X9PyWQkJU1HF+3HKDZGd4xQ7r2ekIgCZZ+0ApzJOnjlhnElgbNZ
         yKGA==
X-Forwarded-Encrypted: i=1; AJvYcCVFTLwbjS19CmRsEaI02BQ/fIT7BnLRhsT9TCPQLREo18YgDM+EUPM5L9uAnnFuYmptsvJMq2vv5y73p87xkw==@kernel.org
X-Gm-Message-State: AOJu0YyBeiH/5A3qqPXj3Hl3js1ZkhfUTUkKcmOr1k0cG8/mIEkCGdS5
	HM9HmJel/bdTlR7/BIsBghX3YiVlFeIbozLT0SddBGQ+cPf55/oEhIXzGmZmWv8nLVCQ6hx9PWk
	Et4LYznAMCCoPyREqcd19peWB/ec=
X-Gm-Gg: ASbGncvMbyuKG4OM+F6ei5SeaX0uaEybn4NyZKd8asRK5Mmh9dQ6gAwfET9CuwHer4M
	96BzyZf5cSGTPtCJLkVWHDspdzh5Rll1O7/hY4Q1r9Uw=
X-Google-Smtp-Source: AGHT+IFMTGx44QwWqHWiREMVp8erOEuKyy/LitqAOpQzpeBHDQG2DTqN/oukat2KCIoRWK53yWLTQ9cJR35y+Lbm8j4=
X-Received: by 2002:a05:6000:1a8f:b0:385:e3c2:a47d with SMTP id
 ffacd0b85a97d-385e3c2a4ebmr1194730f8f.23.1732953680852; Sat, 30 Nov 2024
 00:01:20 -0800 (PST)
Received: from 1008170693301 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 30 Nov 2024 00:01:20 -0800
MIME-Version: 1.0
From: Abhishek Raghuwanshi <viralabhibusiness@gmail.com>
Date: Sat, 30 Nov 2024 00:01:20 -0800
Message-ID: <CAAaVsR8RvOn=UFggiSRWuuseKYeGjsvxYCbu1hos8+ftJjambQ@mail.gmail.com>
Subject: Video Editing services
List-Id: <linux-firmware.lore.kernel.org>
To: garekarsmd@gmail.com, jstory76@naver.com, eureka_skin@naver.com, 
	emily@urbanedgebeauty.co.nz, kiran.k@intel.com, linux-firmware@kernel.org, 
	ravishankar.srivatsa@intel.com
Content-Type: multipart/alternative; boundary="0000000000008f428d06281cb8aa"

--0000000000008f428d06281cb8aa
Content-Type: text/plain; charset="UTF-8"

Dear,

I hope this email finds you well.

My name is Abhishek and I'm a skilled video editor with over 4 years of
experience in crafting captivating visual stories. I specialize in story
tell and video editing, motion graphics, color grading, sound design, etc.

I'm confident in my ability to transform your raw footage into polished,
professional videos that will leave a lasting impression on your audience.
Here's what I can offer:

*Expert Editing*, *Creative Storytelling, High-Quality Visuals,
Professional Sound Design, Quick Turnaround Times*

I'm eager to discuss your specific video needs and provide a tailored
solution. Please feel free to reach out to me at *viralabhibusiness@gmail.com
<viralabhibusiness@gmail.com>* or *+91 7489817338*  to schedule a
consultation.

If you then I can also provide  my portfolio showcasing some of my recent
work.

Thank you for your time and consideration.

Best regards,

Abhishek

Company- Editing Babaji

--0000000000008f428d06281cb8aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


<p>Dear,</p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I hope =
this email finds you well.</span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">My name=
 is Abhishek and I&#39;m a
skilled video editor with over 4 years of experience in crafting captivatin=
g
visual stories. I specialize in story tell and video editing, motion graphi=
cs,
color grading, sound design, etc.</span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I&#39;m=
 confident in my ability to
transform your raw footage into polished, professional videos that will lea=
ve a
lasting impression on your audience. Here&#39;s what I can offer:</span></p=
>

<p class=3D"MsoNormal" style=3D"line-height:normal"><b><span style=3D"font-=
size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Expe=
rt Editing</span></b><span style=3D"font-size:12.0pt;font-family:&quot;Time=
s New Roman&quot;,&quot;serif&quot;">, <b>Creative Storytelling, High-Quali=
ty Visuals,
Professional Sound Design, Quick Turnaround Times</b></span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I&#39;m=
 eager to discuss your specific
video needs and provide a tailored solution. Please feel free to reach out =
to
me at <b><u><a href=3D"mailto:viralabhibusiness@gmail.com">viralabhibusines=
s@gmail.com</a></u></b> or <b>+91<u> 7489817338</u></b>
<span style=3D"mso-spacerun:yes">=C2=A0</span>to schedule a consultation.</=
span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">If you =
then I can also provide <span style=3D"mso-spacerun:yes">=C2=A0</span>my po=
rtfolio showcasing some of my recent
work.</span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Thank y=
ou for your time and
consideration.</span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Best re=
gards,</span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Abhishe=
k </span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Company=
- Editing Babaji</span></p><br>


--0000000000008f428d06281cb8aa--
