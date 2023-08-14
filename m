Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B5BC001E0
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Aug 2023 17:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A65AC433C8; Mon, 14 Aug 2023 17:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2491DC433C7
	for <linux-firmware@kernel.org>; Mon, 14 Aug 2023 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692032618;
	bh=RZ4fucVOaO0zDy1vBaZEa46U6Gr2S2RW8qf8xsWrasE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=cgvNcao5fjdZpq82wxzqAMNcDilUQL6wNs4Z+fRQxxWHJscJO83sU6hsJDjtGO533
	 LjYH5U3Nr4aruY59OwvZ0Gudjf/ZBPJGkwF+EOsDalJaE4tkkF4aOv1Vo34W2FZ7wu
	 4rfi3Hdrglg0YH9Ie0pflCRdgNGMRUKc/tLmbzPKle1cQfZuuoLZ0+e6iA+4UE17L1
	 53ldUkCVWJCgcA0XReieSIRQJOjv25dsZhO7SebUJh+HJR5mu2TjjHXhegZ2xsxPJT
	 BuIhjVS7FNy7rrinUsGsVJSp5k7QEDAlcUMRlpZScflkr46ziFMHgouHUSKpsWMoZQ
	 wXKVDyXiRglcQ==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d6b1025fc7aso1164187276.3
        for <linux-firmware@kernel.org>; Mon, 14 Aug 2023 10:03:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YwIkq2fCGQwO8n0xZIRZC+lN6sj7TT+i7PKGyykvkON7pXDwHuE
	BLbe0ByJF/JhPR37BGqV8jlyk9B6EDg/rNUChlA=
X-Google-Smtp-Source: AGHT+IHQgtCUwP//TQzkWhsq+MhVqeC1+OfX9J1u+DGI3F2JFAcVEVjKmTVIgke3JaEiRApOm1EiuCH/3LxV4yW8X4c=
X-Received: by 2002:a25:874a:0:b0:d63:1cdd:c98 with SMTP id
 e10-20020a25874a000000b00d631cdd0c98mr10444791ybn.12.1692032617167; Mon, 14
 Aug 2023 10:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <BN9PR12MB51453BAE35FDFF09ADC80084FF10A@BN9PR12MB5145.namprd12.prod.outlook.com>
In-Reply-To: <BN9PR12MB51453BAE35FDFF09ADC80084FF10A@BN9PR12MB5145.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 14 Aug 2023 13:03:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6Si7K-hcOLyJTWeQK63LsVps1DK8JoNTO6httorogw4g@mail.gmail.com>
Message-ID: <CA+5PVA6Si7K-hcOLyJTWeQK63LsVps1DK8JoNTO6httorogw4g@mail.gmail.com>
Subject: Re: Update of amdgpu DMCUB firmware
To: "Wang, Chao-kai (Stylon)" <Stylon.Wang@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, 
	"chandan.vurdigerenataraj@amd.com" <chandan.vurdigerenataraj@amd.com>, "Sharma, Deepak" <Deepak.Sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Fri, Aug 11, 2023 at 2:23=E2=80=AFPM Wang, Chao-kai (Stylon)
<Stylon.Wang@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
>
> Hi Josh,
>
> Update amdgpu DMCUB firmware for various display IPs. Please apply.
>
>
> Regards
>
> Stylon Wang
>
> MTS Software Development Eng.  |  AMD
>
> Display Solution Team
>
> O +(886) 2-3789-3667 ext. 23667  C +(886) 921-897-142
>
> -------------------------------------------------------------------------=
---------------------------------------------------------
>
> 6F, 3, YuanCyu St (NanKang Software Park) Taipei, Taiwan
>
> Facebook |  Twitter |  amd.com
>
>
