Return-Path: <SRS0=1Ud/=5H=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31C0C54EBC
	for <linux-firmware@archiver.kernel.org>; Tue, 10 Jan 2023 15:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A17C7C43398; Tue, 10 Jan 2023 15:23:15 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7413C433F2;
	Tue, 10 Jan 2023 15:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A7413C433F2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1442977d77dso12456875fac.6;
        Tue, 10 Jan 2023 07:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UMgN2npGXodxNVMI3mLz0cz/MOXm3XPz0WXjHopfDFk=;
        b=TByY2mAKFLH9oM+BbM+nhrrAWK+VeFjfzSjDFFEFPx+BjbTmpPgXdOM33iiPWHeSeH
         y25K5SoHm8XlhIM02j9jNhZWDRJtcDWH2hGeGa+GmnmCQOrSenPhm2ngUfHB2BZIp+S1
         Aic/yivlSiB+pmNc+Sjr8J3WpKSY6bim2ERcJWddbm8ya/BE2ISZCWgEulEFPHUAoifM
         o3Mqi4ZPFIv2wBe8BO623jN+n4/tIIsofuiuv31dt5qrUMYXf73FG7Kn0wf3fGBlyfqb
         OWkY4JFp9WomZMBpd6XKuUYXyApg/v0kZxQS/m2E2H966Q4bxvgXFpo2/5DySi5udkp7
         YTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMgN2npGXodxNVMI3mLz0cz/MOXm3XPz0WXjHopfDFk=;
        b=J+0SHOuR2DzOlOmO9cnZz3BCMAWV2BfEWuie2TB7hsT5V2c/bLPDBbMrkNIc5oniG6
         C6r7xpZG9dNSCtjrYBCZzFtNYEWFMTrYkqZ7204od7tMwUq7TRc0Ns0F4wyYOR4AwJ/s
         TLM5fegY4Mj9NtJnXD476RM4zpK3lBTaJumb+YgrGqjASB1UmnWtK2mVlKekl1tfUEus
         k53cJfpwdijkFdlVdLcpNhbw2BsTyGsBXPJw/8NkwO4VrtJ5trYOTtNrAgIK+rrTMozJ
         ZrlQH/qkxkG8xtugp849fpvo1rUpDBcj5NocJ901gQ1W+10gD15xZtTSEqYUp88OD9KX
         38ig==
X-Gm-Message-State: AFqh2kqNVAMIGvdx8CvXaQy6CFvccy9QBS3wywmITRZ4sp7buVfihFLR
	V2zSRU+7ZYhHJPu0Fc1vFdDGO7KBRmHmQtoLqDEONST6
X-Google-Smtp-Source: AMrXdXswvn8pRr+bc8JcqA39ZdudLuBX/soOGNzrFqvrpb9FmsxmGgcTRaUsPEjHowmjRNe2m/PDJnRLU/+cUKhHQZY=
X-Received: by 2002:a05:6870:970e:b0:148:3c8f:15ab with SMTP id
 n14-20020a056870970e00b001483c8f15abmr5822075oaq.46.1673364193603; Tue, 10
 Jan 2023 07:23:13 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_PgsVoFiqsiK-qwLFA0e4AZ_S2MjWhj9RtQzcFpjug8MQ@mail.gmail.com>
 <CA+5PVA4Yuow6eLp6E97yh5K==rkaBLxVbiP05v26jEiNv__MxQ@mail.gmail.com>
In-Reply-To: <CA+5PVA4Yuow6eLp6E97yh5K==rkaBLxVbiP05v26jEiNv__MxQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Jan 2023 10:23:02 -0500
Message-ID: <CADnq5_Nq=HGqVgdQWjAQ-MhnipZ1eGrWmg7auxqm9f84hdL6+w@mail.gmail.com>
Subject: Re: Updated amdgpu firmware from amd-5.4
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Tue, Jan 10, 2023 at 10:09 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> All applied and pushed out.  Thanks.
>
> josh
>
> On Tue, Jan 10, 2023 at 10:05 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Please apply.
> >
> > Thanks,
> >
> > Alex
