Return-Path: <SRS0=LeUI=2R=gmail.com=neillanden.mypackagingpro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE762C87FD1
	for <linux-firmware@archiver.kernel.org>; Tue,  5 Aug 2025 17:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2EF9C4CEF8; Tue,  5 Aug 2025 17:31:22 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F09B3C4CEF0
	for <linux-firmware@kernel.org>; Tue,  5 Aug 2025 17:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F09B3C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-7075bcdbb0fso28974996d6.0
        for <linux-firmware@kernel.org>; Tue, 05 Aug 2025 10:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754415080; x=1755019880; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SVy+u2lrhZT/BW64PRVaq4KfTKeOsmH/cn3z9XmxgP8=;
        b=IlMFZs38NEhPDMPeYOendKtJgd00T55Go5erPkUoXNgkeWW7KZuIf6uEgwD6D7EhgY
         RV1H+XUhYVXkish9uJ0omaRweg9T6cOa682FG7EBMksTwaT+tVNtC+HLI6TgyXsvQGtB
         l1rP6NZiVrYw1k/9J7Fa7Ay4WsrglOTZuGLinIJITcuno6knSNRqYVSSPII9Q0QPsYSb
         o2gs+amFtH8V+qN1NdJYu9cfyXq3xrDH5hjPsV0v9afImmhipDayFUP68MGCpz351PLn
         jWei9DElUvG0AnJU8+GUbIGQEXqt/2X071vg6zmSNzKh/ArTcqxtM7nUCYjlo+rLDn0v
         tefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754415080; x=1755019880;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVy+u2lrhZT/BW64PRVaq4KfTKeOsmH/cn3z9XmxgP8=;
        b=wuhC4V0pHNfuIjpwrhi9EYJ76RS2C+t5vq/7dDMd6ItApUKEYp7U1/Hrdrtrfat6rz
         BisMrWBi5c4HlDuBX2aOjgbTSDTYye9wCGZelsNIP7GmLM7tMdV+GMPdINtyRz5FdCvr
         LAUZEFlMkpDQQzQ3Llpiuf1V6DCSEAlpi7gGemPPcBtxinxMobcosZ7HX3gVRWUX+CLa
         p5MHMq754W77his7yCanhGoiSEdRG9Rk+Etf8K/n+30TB13ybwUdzpbX1mHizrKpyXq4
         f3JHKCw9cvq43epI7xjt6b7iYy25lqM7+R4iLnoUFTOYU+WtXBYqohKuMgXjLTzWw6OV
         TM6g==
X-Gm-Message-State: AOJu0YwU5vNR2zT+UOFUuq1KzP1EjH7tBAosVWiyuOwbhkq4SqbhDxsW
	Abij75bCma8OLnsQrkDEOKzkHjxUbaqzhe+9aDDo6MTYqRyGRMOGXGYrK36jus7erWPwgyrffqO
	NoVEk/me+q+KWiyxHm53Yvid36dREhNPZUA==
X-Gm-Gg: ASbGncsiktKANuomUkcPqzmbmDkXIh1moBTKRyFYoibgs1ifzWan+IsxR9X2F5jDcN6
	ENmga5csI/0VeyJQMPFB6ecuF2awJAijL1vcpNu9CIedMEI1gTewthw3RSRvZ/3WRT3hPFwXqLK
	2LG9TesNUek0uuDJLnv3BzCRQ07L/kyHTQ7YQDQiz/wE3Mr6RBQSqc+D7R+oVSevpx06Y+nv4Jb
	SluYreL0Zc=
X-Google-Smtp-Source: AGHT+IFtrUsA69jNx2pLJEtCin/AlrcDbzL3oHJYnyW18PygLLkVIkANN0EauYoMhK40vu2TAHwwz8XfBYE+yZXAEPQ=
X-Received: by 2002:ad4:5ae3:0:b0:709:2e0e:f761 with SMTP id
 6a1803df08f44-7097971fd85mr448156d6.45.1754415079767; Tue, 05 Aug 2025
 10:31:19 -0700 (PDT)
MIME-Version: 1.0
From: Neil Landen <neillanden.mypackagingpro@gmail.com>
Date: Tue, 5 Aug 2025 13:32:43 -0400
X-Gm-Features: Ac12FXw7l3vndcOqnQ6Xkgq2Sjv6BxtHg4TbKveUD_ndBy-BnyyQJEwLSw_r4l0
Message-ID: <CA+7exXvCmF-W4NFzJJV1U+MuYTdxzcitHZXHKm1OYwDD9pvnRQ@mail.gmail.com>
Subject: Personalised Bags and Boxes
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="0000000000009e4497063ba19770"

--0000000000009e4497063ba19770
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

We make personalized packaging=E2=80=94tuck boxes, CBD boxes, mailer boxes,=
 rigid
boxes, bakery boxes, retail boxes, shopping bags, label stickers and more.

Simply provide us with the dimensions (L x W x H), quantity, and preferred
box style, and we'll provide you with a competitive quote. Plus, for a
limited time, we=E2=80=99re also providing complimentary design services an=
d
shipping on all orders.

Thanks, and looking forward to potentially working together.

Best regards
Neil Landen
Marketing Executive
My Packaging Pro.

--0000000000009e4497063ba19770
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br><br>We make personalized packaging=
=E2=80=94tuck boxes, CBD boxes, mailer boxes, rigid boxes, bakery boxes, re=
tail boxes, shopping bags, label stickers and more.<br><br>Simply provide u=
s with the dimensions (L x W x H), quantity, and preferred box style, and w=
e&#39;ll provide you with a competitive quote. Plus, for a limited time, we=
=E2=80=99re also providing complimentary design services and shipping on al=
l orders.<br><br>Thanks, and looking forward to potentially working togethe=
r.<br><br>Best regards<br>Neil Landen<br>Marketing Executive<br>My Packagin=
g Pro.</div></div>

--0000000000009e4497063ba19770--
