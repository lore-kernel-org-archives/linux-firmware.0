Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579A3C7EE2D
	for <linux-firmware@archiver.kernel.org>; Tue, 23 May 2023 17:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1AB90C433A0; Tue, 23 May 2023 17:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059BAC433EF
	for <linux-firmware@kernel.org>; Tue, 23 May 2023 17:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684861476;
	bh=mRZ6DZ+/rl+sZ0sGEtNvD0vyTz74rhwb47Q0PEPVjtw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NcwsZ8QXHd/36w9PL8I2Zc+xi35IoyKZjqt+UFTUXh0kJm3sTVF3gFclH0kNlEKnZ
	 0jRAZ5J17SqkSBhojzxAXBAoV6ZPY/imlA0JfQNg4S6iAFRfUXJg65J2QAn70kXhSD
	 9SrTOMNwrh64B3gYfuxODEWHvAnKucO/2S1gIdgWrL4SOGZIxugRvlG02jIIW7gvyw
	 zPajkQDRmjDXRhSCyZxbsDJuo43xiT8gJ01vojYF/koB60hAVK+cDgt2LJLmIa5tsT
	 o2JrkzrRpg4TR/i4iT0iKzTTiRfArcKa03X5Kxluh6ZHWMaR03Hp//ZGTYJDXU4CaB
	 BrPaGSgfkrH/Q==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-babb985f9c8so7543778276.1
        for <linux-firmware@kernel.org>; Tue, 23 May 2023 10:04:35 -0700 (PDT)
X-Gm-Message-State: AC+VfDyh80K+ogkjxVFG3dgc03CoN/zAe0Mrhign92NvyhHNp3rSKYbp
	mkz8W4NJUNtouc6BkWi5z2OkH20+tytsPjGEHr8=
X-Google-Smtp-Source: ACHHUZ7quiZniJVoh8jv3MgFTBbMdxgBqhE+CxFxvrlj+QbIGm/atSalVIlmO88xPSwfKsbmdovP2iWdxt+gS4hFlJg=
X-Received: by 2002:a81:de4d:0:b0:55a:af7d:8e27 with SMTP id
 o13-20020a81de4d000000b0055aaf7d8e27mr17221461ywl.25.1684861475035; Tue, 23
 May 2023 10:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <CH0PR12MB5284B5BDC32C5CDB44DB05168B7C9@CH0PR12MB5284.namprd12.prod.outlook.com>
In-Reply-To: <CH0PR12MB5284B5BDC32C5CDB44DB05168B7C9@CH0PR12MB5284.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 23 May 2023 13:04:24 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4T+f726myjpwCPB9x7VTOChJgREtsUKg5UKvoH-Dk4WQ@mail.gmail.com>
Message-ID: <CA+5PVA4T+f726myjpwCPB9x7VTOChJgREtsUKg5UKvoH-Dk4WQ@mail.gmail.com>
Subject: Re: Updated amdgpu DMCUB firmware
To: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, 
	"VURDIGERENATARAJ, CHANDAN" <CHANDAN.VURDIGERENATARAJ@amd.com>, "Sharma, Deepak" <Deepak.Sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 4:54=E2=80=AFPM Pillai, Aurabindo
<Aurabindo.Pillai@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
>
> Hi Josh,
>
> Updated amdgpu DMCUB firmware for various display IPs. Please apply.

Applied and pushed out.

josh
