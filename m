Return-Path: <SRS0=sRWc=JK=gmail.com=superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778E0C47DDF
	for <linux-firmware@archiver.kernel.org>; Thu,  1 Feb 2024 12:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F5C5C43390; Thu,  1 Feb 2024 12:08:18 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FC25C433F1
	for <linux-firmware@kernel.org>; Thu,  1 Feb 2024 12:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6FC25C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5d7005ea1d0so547677a12.1
        for <linux-firmware@kernel.org>; Thu, 01 Feb 2024 04:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706789296; x=1707394096; darn=kernel.org;
        h=mime-version:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V+D+D4Kb5vCI7Cwqmz0A+8jbT4f3GSYnQjqlxDl/6MI=;
        b=RFc7/U0nsJoMYKH1dgkGT8YaIh7pxMrigYp2C3QmwZFjWwbFBiuRwkVS88j1aqJDJh
         jMOVGNnKcpicTuI8e5Ts3f89s8nLwjFr1/GSMsxAdCW6cWw+K6q9FhIjDbU8QTByJbRI
         +B7Xk8HOAdsjqIJ1/Hrk/vW2070vux3C6ZYd+9THYpEG9pv+svmrhu8tGYZ0/+gJFKxu
         J9tG+6VQ6e2l/gzyi4n46LXoMiRbdNy7oIUBS0UVzg78V8Q44VC/9s4jh0OZ76BOH3es
         RBK77Q8cPlGYvdtAXkJGy+w0ad7JcFHQythE4HJ2TPZKXqcNwGk2PRbqA0D54ReDWryn
         ssAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706789296; x=1707394096;
        h=mime-version:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+D+D4Kb5vCI7Cwqmz0A+8jbT4f3GSYnQjqlxDl/6MI=;
        b=G+6weEwPdjIJ6GOdwpieJsHC0UjnoK+F8khVTbyw6drctYDDbZdLsf6Fl7gJpQSVGp
         HmYfZWtd8Kv+FfAOaCu1U0jhBxvt3US7RtaOxRcMrsLP96uhLRHu3ElWQLyDw3l3NRMo
         E+7LGy5DGsa0DHknGU+3ILg+B1AnPMXSk4zdQLUovB6uOnw2X2HHBya7+utml147CWEl
         qDUh7wkOd2LlCbmtzXqhIkusHKToY0SXQq/+k8YE0hEzVOh4t1x59h/YsgKEyo2gHFu6
         E3hd/Fv245c2Ov7VKVP//wY038xkI6yBYJ2t4BopXnCedkpCA4RznCdhv353rbNbugkn
         vMpA==
X-Gm-Message-State: AOJu0Yx32ow/qe4AbFX+826g4Zt8iFZYzOmZgNxe+JV36naNESoG76Bq
	VvBWZmX7FbnvJR7PivTYYr3PRyXXL1VrQUVIqd/cTVtix+1ReNRV
X-Google-Smtp-Source: AGHT+IEfFsWA02Zw53JIiuebNEvlzSdeUkvGM+uRrtNWm7+HN4OR6xD1bBu0OYO4DCqi2/Z8dF0Qfw==
X-Received: by 2002:a05:6a21:918b:b0:19a:5485:fdef with SMTP id tp11-20020a056a21918b00b0019a5485fdefmr5865690pzb.7.1706789296330;
        Thu, 01 Feb 2024 04:08:16 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWNAWckSJK+3d2NFneKMqI5YJpf1HPfP537yJ1E/ajnjtM0Z5Cl45M2yz4LNbADEMhjgkviW4fOPbfTkQGxAQurA8hl83CSsdXl6jjR9aYPR21T65pqbdWddYQbO5LY
Received: from MW5PR84MB1500.NAMPRD84.PROD.OUTLOOK.COM ([2603:1036:308:3822::5])
        by smtp.gmail.com with ESMTPSA id y17-20020a62f251000000b006dd8643d468sm11448852pfl.193.2024.02.01.04.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 04:08:15 -0800 (PST)
From: Mario Limonciello <superm1@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Sakari Ailus <sakari.ailus@iki.fi>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: Bingbu Cao <bingbu.cao@linux.intel.com>, Hans de Goede
	<hdegoede@redhat.com>
Subject: Re: IPU6 firmware license
Thread-Topic: IPU6 firmware license
Thread-Index: AQHaVOP0p0t43vXx3EyOfVIvBpW3ErD1ZNtV
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 1 Feb 2024 12:08:14 +0000
Message-ID:
	<MW5PR84MB1500E45AA1DDB1B8A117C109F0432@MW5PR84MB1500.NAMPRD84.PROD.OUTLOOK.COM>
References: <ZbrCw1AVnW6APq56@kekkonen.localdomain>
 <ZbtOQ34d5etYC42F@valkosipuli.retiisi.eu>
In-Reply-To: <ZbtOQ34d5etYC42F@valkosipuli.retiisi.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: multipart/alternative;
	boundary="_000_MW5PR84MB1500E45AA1DDB1B8A117C109F0432MW5PR84MB1500NAMP_"
MIME-Version: 1.0

--_000_MW5PR84MB1500E45AA1DDB1B8A117C109F0432MW5PR84MB1500NAMP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Got it, thanks.

________________________________
From: Sakari Ailus <sakari.ailus@iki.fi>
Sent: Thursday, February 1, 2024 1:54:43 AM
To: linux-firmware@kernel.org <linux-firmware@kernel.org>; Mario Limonciell=
o <superm1@gmail.com>
Cc: Bingbu Cao <bingbu.cao@linux.intel.com>; Hans de Goede <hdegoede@redhat=
.com>
Subject: IPU6 firmware license

Hi Mario,

(Resending with correct list address.)

LICENSE.ivsc is already present in the tree. I could add another file for
IPU6 firmware but it'd be a copy of LICENSE.ivsc.

--
Regards,

Sakari Ailus

--_000_MW5PR84MB1500E45AA1DDB1B8A117C109F0432MW5PR84MB1500NAMP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto">Got it, thanks.</div>
<div><br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Sakari Ailus &lt;saka=
ri.ailus@iki.fi&gt;<br>
<b>Sent:</b> Thursday, February 1, 2024 1:54:43 AM<br>
<b>To:</b> linux-firmware@kernel.org &lt;linux-firmware@kernel.org&gt;; Mar=
io Limonciello &lt;superm1@gmail.com&gt;<br>
<b>Cc:</b> Bingbu Cao &lt;bingbu.cao@linux.intel.com&gt;; Hans de Goede &lt=
;hdegoede@redhat.com&gt;<br>
<b>Subject:</b> IPU6 firmware license</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Mario,<br>
<br>
(Resending with correct list address.)<br>
<br>
LICENSE.ivsc is already present in the tree. I could add another file for<b=
r>
IPU6 firmware but it'd be a copy of LICENSE.ivsc.<br>
<br>
-- <br>
Regards,<br>
<br>
Sakari Ailus<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW5PR84MB1500E45AA1DDB1B8A117C109F0432MW5PR84MB1500NAMP_--
