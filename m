Return-Path: <SRS0=S0Il=QS=gmail.com=seolinkpage@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF15CCF9C52
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Sep 2024 15:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8B6EC4AF0B; Fri, 20 Sep 2024 15:33:42 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD7DFC4CEC3;
	Fri, 20 Sep 2024 15:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD7DFC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5e58237a1aaso1012462eaf.3;
        Fri, 20 Sep 2024 08:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726846420; x=1727451220; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GVu1Ju1T6v5jaGikLIsWF1s6KwD9ZdwEO21i0U6WULs=;
        b=JAQSKe6mWEEHpPYdXvNRWEbXz/DWQGTJg31VfU+P7vDh1NTTYbbZR9v2nh8f6TscP/
         TBBj82WONag55fy8t3OvWxNu8u5DOg1ZCo2y9CE/ZLN44Rwa95eEejp/oFzgFAr7HSa9
         sRIY1R2uwm0v80fvVm3ft2lPQCKyZhKnmmlrjOKuGM4oPFhREft2LOCmTdkRTeUam+iC
         7WJbJY6+5hxQ0ft2S7bOFMW9e4U6HK9YbBWvhnIr4QF8BJfH+SuFWNJ0wd4kbDCdRku+
         +1JI0aFqILogNyc0n1+dzYnnX2oXrj9zuhYSNzQQuxs3Zp5CxQn97nvC3FpK+dYRxZ9N
         os7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726846420; x=1727451220;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVu1Ju1T6v5jaGikLIsWF1s6KwD9ZdwEO21i0U6WULs=;
        b=JqqA8udYApC8lLousw9Fl+XhE5Clq2Jx5gOnX/Pzvb+hlShb6vbbI/zBbGh1AHki+b
         GXK1zqsIZC9sdq6VCAS0wVPZ0DPKAB7cxPhrMSJJw81DhuHtSgK26y3p21+d+liaKoPp
         /aj8rSbXU1Kli2z82fxHfwiadG056QFV1BTR+2r1NEbsZXrTs9Nv1oWfVTv/Ljou0Hqk
         lcIAMBc80KyfYnqhdj9hFTpgoX35de0XTtFiNP3WyFkAKurURnzccxq0Pxk4doVSoLfL
         LwwwbdG8XEl8m+GuZ7yqfpzVsz4p1uwbiszNa0pkfsARFKqGXbFv5fSDOCBKoSGWSF+5
         qH+w==
X-Forwarded-Encrypted: i=1; AJvYcCUpsqVagFZKoD11eCWmb/E3HCZD2usEjA1M5ydtb7T2b05bbWBAX0xofTfsulDwAEH4vxY1vfYX1y1FUG6rNRg=@kernel.org, AJvYcCVZTNMk4aDlhOyW7S2f1hyVgZ+v4GEQayIfy7YIt2wEGqo8ikS4zLhzYXeNqZQjJrnDzk4T+shp7A==@kernel.org, AJvYcCVhIgrEI/nhvNDua0jb3FtG4UH+aFTo62Hg2d43FRcO3voqUHGfJWEHzSgWKx+68QGjvj56hYob@kernel.org
X-Gm-Message-State: AOJu0Yw0fcAPQZsnFiowOy6Gfd+lfCCe8/RjOeE9SwOQUv/zSUWu/QJ3
	X1ymYUNn449sup2xzdSkGN5LZ/lj7nbsAuePjRrhXPego3D0vMtEjVM603TQZOUhw77a9yuYHxF
	HvFmJ6CvLBPlehFq83w5mpe7HlEraYQ==
X-Google-Smtp-Source: AGHT+IE4XK8hFBQd3Pxn9MsW6ThaogiES6yuA/SA8umpGhDkKMnMiRT6wwL3tDgfHWqwzTcXjEzrPIeapXh6f7meOBY=
X-Received: by 2002:a05:6820:22a4:b0:5e3:b361:e457 with SMTP id
 006d021491bc7-5e58b9e2e41mr2529963eaf.1.1726846420540; Fri, 20 Sep 2024
 08:33:40 -0700 (PDT)
MIME-Version: 1.0
From: offf Page <seolinkpage@gmail.com>
Date: Fri, 20 Sep 2024 08:33:33 -0700
Message-ID: <CAPgFy0fU93itUpOX7aNHAgZKHt8sy-qQCPy_Hy8j_NOYQw-pcw@mail.gmail.com>
Subject: =?UTF-8?B?SW50ZXJlc3RlZCBpbiBHdWVzdCBQb3N0aW5nIG9uIFlvdXIgU2l0ZcKge2h0dHBzOi8vaw==?=
	=?UTF-8?B?ZXJuZWwub3JnL8KgwqB9?=
List-Id: <linux-firmware.lore.kernel.org>
To: security@kernel.org, linux-firmware@kernel.org, helpdesk@kernel.org, 
	stable@kernel.org
Content-Type: multipart/alternative; boundary="0000000000007a691806228ec3b7"

--0000000000007a691806228ec3b7
Content-Type: text/plain; charset="UTF-8"

Hello,

Please provide me with the details of the submission process and the
associated fees. Additionally, could you send me a sample of a high-quality
post from your site?

Thank you.

Sincerely,

--0000000000007a691806228ec3b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello,<=
br><br>Please provide me with the details of the submission process and the=
 associated fees. Additionally, could you send me a sample of a high-qualit=
y post from your site?<br><br>Thank you.<br><br>Sincerely,<br></div></div><=
/div></div><img src=3D"https://email-signature-image.com/signature.gif?u=3D=
3489491&amp;e=3D644531516&amp;v=3D932a992f20cb0001fc256d2ac55d94624d0a96482=
5614682fe5d9307baf25828" alt=3D"" width=3D"0" height=3D"0" style=3D"width:2=
px;max-height:0;overflow:hidden">

--0000000000007a691806228ec3b7--
