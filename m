Return-Path: <SRS0=viRf=S3=gmail.com=viralabhibusiness@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0130DD10DB4
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Dec 2024 07:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE916C4CED9; Mon,  2 Dec 2024 07:42:49 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE5D1C4CED2
	for <linux-firmware@kernel.org>; Mon,  2 Dec 2024 07:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE5D1C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53de8ecafeeso4097885e87.1
        for <linux-firmware@kernel.org>; Sun, 01 Dec 2024 23:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733125367; x=1733730167; darn=kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ORQuF4Zcq/EUFNIh/NNNK5L8wwSncwjOYM+Q5M6vZ+s=;
        b=WCVF+Gw1kkii6ouhKkrcQ4z40ulLooBFV8UFHT5XY0Dfc5pw/DwgVvdfOFaPYA2WLG
         2PGIPRtVIkrvb0DKXZtIoecpJhLQ9BUUuFegFkwqHQgly7UbhQ9anEYuZyjnf+G19nNg
         +ynkWh+wzbBWkLwwn6AMbqeAf2Z0WO+kO5g+9I8sklx0k8HWi97YJDO8dpxoI/mk6eXT
         Uie4sq/5Y35sd1K3od+CoA215KmCiS508ua1xJx2QbVu8eUyxyCVgVax8Wk9imxyVoCq
         QP9NNPOby7lPVFV72qTjJ71UBhqxH4hReT50d0Ef+U7l+08W+2UddUccE6gD6BRFjoH+
         ppkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733125367; x=1733730167;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ORQuF4Zcq/EUFNIh/NNNK5L8wwSncwjOYM+Q5M6vZ+s=;
        b=oUI03l2Y2KYbs9kVgSVrriI1B8L2TC3eGoikCEbLYov1uJ8oyhvFrERydGOA9sWVJY
         hYug9KcvVXm3fQXiFEcNXFKRKDIfeMJx4/EqStvfEUo/KLvKrVylQtUzA0JIMq40kEd5
         aBuEGxxDXYYGdAIK3McYk/6Qcym/bDS6oeBnpzIKHzKd2nwM+/9DL3wtd2oMQ5sJkP/X
         QTNAIhgO3/5jMqUSdv8SvdixNTN9sbC2i9GHWOyxY0DESIHR2Nk/niOKn6SKD+e41Bmq
         zlpiGq/EYPFKauiLUZSf+miHA006/gUt1qRQ6X3QwlYUqMDLOLvmSy3i8ABEuRYP35XD
         2fsg==
X-Forwarded-Encrypted: i=1; AJvYcCVsxT7qPpZ9N5vyy8KqEcCS1pT+SuwKcFUtIRBGAiu1nA6fkttC+LvdS71TbomQMiFfBxpme7iIz6dA3Vu+1g==@kernel.org
X-Gm-Message-State: AOJu0YwEJ09AWsdHqCgpCUJkxdiE4RzXhNkqKBRS0qlpbS570s0VIOI2
	PZJwMwM4T/WmjKdAs7b3rmvJ8THqJ1d7XWWjqYkn/DKAUGk2mHlIrBuYmTfE/+NwvhJOVI0dUyJ
	Z0lpNU96Crqyq2b8tUqmV4ikkHBY=
X-Gm-Gg: ASbGncums3siZjirzMYnXRV10v/APS70niUwsl1o7o4QzoQef0tuFQvkC3MzgZkEvMA
	T1HSB0wO5HA98RTEZ2/9RF8/OS2TJlWkK1TxtAPuKO2nMuSI=
X-Google-Smtp-Source: AGHT+IFARwLaMC4VZVAFjDpB2wEi7fwDBZ6GwwBXzXF+N6SiR0AOF+nCZWZ3p231p123TB12uVKgO8Ja5qQwZE3PNIc=
X-Received: by 2002:a05:6512:b14:b0:53d:dda4:8b0c with SMTP id
 2adb3069b0e04-53df00d0332mr11507439e87.18.1733125366668; Sun, 01 Dec 2024
 23:42:46 -0800 (PST)
MIME-Version: 1.0
References: <CAAaVsR8RvOn=UFggiSRWuuseKYeGjsvxYCbu1hos8+ftJjambQ@mail.gmail.com>
In-Reply-To: <CAAaVsR8RvOn=UFggiSRWuuseKYeGjsvxYCbu1hos8+ftJjambQ@mail.gmail.com>
From: Abhishek Raghuwanshi <viralabhibusiness@gmail.com>
Date: Mon, 2 Dec 2024 13:12:34 +0530
Message-ID: <CAAaVsR-ssWKAru8+=cZ=R5V_U5RLn1t4MniGeUffwaFAjuXw+w@mail.gmail.com>
Subject: Re: Video Editing services
List-Id: <linux-firmware.lore.kernel.org>
To: garekarsmd@gmail.com, jstory76@naver.com, eureka_skin@naver.com, 
	emily@urbanedgebeauty.co.nz, kiran.k@intel.com, linux-firmware@kernel.org, 
	ravishankar.srivatsa@intel.com
Content-Type: multipart/alternative; boundary="000000000000d4e5a8062844b159"

--000000000000d4e5a8062844b159
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

I hope this email finds you well.

I'm following up on my previous email. I wanted to see if you're interested
in discussing how my graphic design services can help you create stunning
visuals for your brand.

Let's chat about your project!

Best,
Abhishek

On Sat, 30 Nov 2024, 1:31=E2=80=AFpm Abhishek Raghuwanshi, <
viralabhibusiness@gmail.com> wrote:

> Dear,
>
> I hope this email finds you well.
>
> My name is Abhishek and I'm a skilled video editor with over 4 years of
> experience in crafting captivating visual stories. I specialize in story
> tell and video editing, motion graphics, color grading, sound design, etc=
.
>
> I'm confident in my ability to transform your raw footage into polished,
> professional videos that will leave a lasting impression on your audience=
.
> Here's what I can offer:
>
> *Expert Editing*, *Creative Storytelling, High-Quality Visuals,
> Professional Sound Design, Quick Turnaround Times*
>
> I'm eager to discuss your specific video needs and provide a tailored
> solution. Please feel free to reach out to me at *viralabhibusiness@gmail=
.com
> <viralabhibusiness@gmail.com>* or *+91 7489817338*  to schedule a
> consultation.
>
> If you then I can also provide  my portfolio showcasing some of my recent
> work.
>
> Thank you for your time and consideration.
>
> Best regards,
>
> Abhishek
>
> Company- Editing Babaji
>
>

--000000000000d4e5a8062844b159
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi </p>
<p dir=3D"ltr">I hope this email finds you well.</p>
<p dir=3D"ltr">I&#39;m following up on my previous email. I wanted to see i=
f you&#39;re interested in discussing how my graphic design services can he=
lp you create stunning visuals for your brand.</p>
<p dir=3D"ltr">Let&#39;s chat about your project!</p>
<p dir=3D"ltr">Best,<br>
Abhishek</p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat=
, 30 Nov 2024, 1:31=E2=80=AFpm Abhishek Raghuwanshi, &lt;<a href=3D"mailto:=
viralabhibusiness@gmail.com">viralabhibusiness@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<p>Dear,</p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I hope =
this email finds you well.<u></u><u></u></span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">My name=
 is Abhishek and I&#39;m a
skilled video editor with over 4 years of experience in crafting captivatin=
g
visual stories. I specialize in story tell and video editing, motion graphi=
cs,
color grading, sound design, etc.<u></u><u></u></span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I&#39;m=
 confident in my ability to
transform your raw footage into polished, professional videos that will lea=
ve a
lasting impression on your audience. Here&#39;s what I can offer:<u></u><u>=
</u></span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><b><span style=3D"font-=
size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Expe=
rt Editing</span></b><span style=3D"font-size:12.0pt;font-family:&quot;Time=
s New Roman&quot;,&quot;serif&quot;">, <b>Creative Storytelling, High-Quali=
ty Visuals,
Professional Sound Design, Quick Turnaround Times</b><u></u><u></u></span><=
/p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I&#39;m=
 eager to discuss your specific
video needs and provide a tailored solution. Please feel free to reach out =
to
me at <b><u><a href=3D"mailto:viralabhibusiness@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">viralabhibusiness@gmail.com</a></u></b> or <b>+91<u> 7=
489817338</u></b>
<span>=C2=A0</span>to schedule a consultation.<u></u><u></u></span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">If you =
then I can also provide <span>=C2=A0</span>my portfolio showcasing some of =
my recent
work.<u></u><u></u></span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Thank y=
ou for your time and
consideration.<u></u><u></u></span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Best re=
gards,<u></u><u></u></span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Abhishe=
k <u></u><u></u></span></p>

<p class=3D"MsoNormal" style=3D"line-height:normal"><span style=3D"font-siz=
e:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Company=
- Editing Babaji<u></u><u></u></span></p><br>

</blockquote></div>

--000000000000d4e5a8062844b159--
