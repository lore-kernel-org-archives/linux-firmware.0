Return-Path: <SRS0=KWl1=W2=gmail.com=samk.threatsecure@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E0AC36010
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Apr 2025 11:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F731C4CEE5; Tue,  8 Apr 2025 11:56:40 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78143C4CEE7
	for <linux-firmware@kernel.org>; Tue,  8 Apr 2025 11:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 78143C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4775ccf3e56so67592611cf.0
        for <linux-firmware@kernel.org>; Tue, 08 Apr 2025 04:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744113398; x=1744718198; darn=kernel.org;
        h=mime-version:date:content-transfer-encoding:subject:to:from
         :references:in-reply-to:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zbTJdRP/ph2YmaY/glI3bES4ZN0RFEKeoysgXXS7JA=;
        b=LoPWLIn1PSzXhpB03P2sC5da2xhAE0FrrgYrTo0mVIfxVfVa3Gvv1l/2pdFVWwwu+y
         Dl4IC+WY+sOnFbXRmAmOA9vwfKinc9pDTBUGTieFpowAF/1cQ3cHCd5BmdjqWDe/qb4c
         EkYkiO0sYNAClRMqpjd52AUXuhVWWRT32crV+Ueiey9qtkJHq7bI3pOWK7+LC+aZPwVU
         wNcxOP2CvM66KNWrBNdtzSVHMRuTNVIntuvFHmvOIYyuM3bjELy7EsTgxzQuNv6PLTWj
         B5DIFB5CIYjqMl2uPO1J978bnTmXT2S1X9PIcw5rMMgrJW0iF7u8gfnx0hX7Dum9u56F
         S3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113398; x=1744718198;
        h=mime-version:date:content-transfer-encoding:subject:to:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zbTJdRP/ph2YmaY/glI3bES4ZN0RFEKeoysgXXS7JA=;
        b=qjV9xmxv7tTnN3m2Qyxzzq5sQuHab9c3KS8DUSFCl3lt/jOWISvAqe8DA2zISbPyK4
         V0liCZxZQk/ojr5p9j+ANdu5Z1JjpBRMCndgTRTkRREJgkulRv66Vrj+Yp47pMX1ztKy
         O3EP9hBK/yTT7kRpkXs17ZYchN1/FQbKy4OrM7Sa7yj7lj6wyq+fDjBVn8/YtEYyK7eR
         EVrSyryoI/mlmVMyR+QDtfZNpJ/RxbRxUFpb0bBYe5Yfu6FK5+0D4FPsRzmQsCwVgQ12
         OGBCSEBVS4d9MAU501Kb40NGt1CLcNx8nSErIsNFBz5zAkGlqbBouOz2pAq3YAJ69WqE
         rWjQ==
X-Gm-Message-State: AOJu0YyKpJ51zXiJpPNJSk9vt1kUaey3LoHP1OdCUUsAgUbl+QEQiWWP
	iPT/7jXu1gSqLGd1yy67FXqMMi5W2E+tCmLpSsUs8y2PDsaOqMo7zWAdsw==
X-Gm-Gg: ASbGncsmSI1zWxMV+GX/YFwb671++jRGizaSvzy4Dzub/pkeCl/xwMcXYbIl6PtgtKD
	iagjHN+Vo/1LuwTt1T2XOQlCqzNOInOOjijKhS9xNBTmXSrodYyWwiVodSMYGk9+CrrkuqBR8K9
	d5ZDTS7rIC1JkVcor3Q2Rp3hNUXq8XzYivVJHCyWX9wxVcuQM0oFSHXRTLpPJLvHebyXkPAJD82
	BQSnletTIv+BK1/FMdTp/xgZhpGWfqaOD+yUNE71KtHfhsqIT6o9S85CKDGM/nyleO6khLOo2zS
	3Ubj5CMmxqrYUhahg1OQw9+L54y8wYIRDCA7otP7/woaChjZR3N+/mBOQfrPJur4KS+xWmmCs4a
	L+MHjL1/icrE33da8cxqQoihrPLRuOh8mgi+tKYdncftgT+GS8Iu0kxxNEBue5orEvH+LBEhYPT
	TgA5o=
X-Google-Smtp-Source: AGHT+IE4eDXqdvA/euFPH43WxDFAQoayBoNv1TeQD4pnvn9LxhPRkTIrf+NKaADjbAaVwuQeIxwATQ==
X-Received: by 2002:a05:622a:11:b0:472:145:3e02 with SMTP id d75a77b69052e-47953ea8416mr52340871cf.8.1744113397491;
        Tue, 08 Apr 2025 04:56:37 -0700 (PDT)
Received: from 7685bdd0-74cc-4dcd-9f24-a0f9c023ba41.local (ec2-3-86-58-242.compute-1.amazonaws.com. [3.86.58.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b05855dsm75337951cf.4.2025.04.08.04.56.36
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:56:36 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Message-ID: <7685bdd0-74cc-4dcd-9f24-a0f9c023ba41@gmail.com>
In-Reply-To: <399e176e-b666-4bea-9c4e-c51426853478@gmail.com>
References: <399e176e-b666-4bea-9c4e-c51426853478@gmail.com>
From: Sam K <samk.threatsecure@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Re: kernel.org
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Apr 2025 11:56:36 +0000
MIME-Version: 1.0

Hello Guys,

One last follow up here. Is this the right email to reach out =
to about security in kernel.org?

Let me know if there's someone else I =
should reach out to.

Appreciate it,
Sam

Sent from my iPhone

On Tue, April 1, 2025 12:03 PM, Sam K <samk.threatsecure@gmail.com>
[samk.threatsecure@gmail.com]> wrote:

> Hi Team,
>=20
> Were you able to get my last email?
>=20
> I can understand that you =
might be busy, which is why I'm reaching out again.
>=20
> Appreciate it,
> Sam
> On Fri, March 28, 2025 12:44 PM, Sam K <samk.threatsecure@gmail.=
com>
> [samk.threatsecure@gmail.com]> wrote:
>=20
> > Hi Team,
> >=20
> > Just bumping this to the top of your inbox!
> >=20
> > Looking forward to hearing from you.
> >=20
> > Thanks,
> > Sam
> > On Wed, March 26, 2025 11:39 AM, Sam K <samk.threatsecure@gmail.com>
> > [samk.threatsecure@gmail.com]> wrote:
> >=20
> > > Hi Team,
> > >=20
> > > I was checking out kernel.org and spotted a few things that could =
make your site a target for cyber attacks.
> > >=20
> > > Do you have any kind of formal/informal bug bounty or reward program =
for researchers to find and report security issues? If so, please let me =
know, and I'd love to check out the specifics see how I can help.
> > >=20
> > > If not, please let me know if you=E2=80=99re open to rewarding =
researchers for valid vulnerability reports at your discretion.
> > >=20
> > > Cheers,
> > > Sam
> > >
