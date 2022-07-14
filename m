Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44562C433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 14 Jul 2022 10:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16E74C3411C; Thu, 14 Jul 2022 10:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27D6C385A2
	for <linux-firmware@kernel.org>; Thu, 14 Jul 2022 10:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657796215;
	bh=dKKg2sCXF5KKLqAMIlztRHCoSCmEnHX0sfGDkfhScPM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LeBG2qMRHAA2QdNVoNisUq6lThGWPeI8H4DkL6pqITP59sftMBk0vdAD5CiVCXxc8
	 iImjiTAvIUHeuYLi9Shdz7nJ089yw28nC/633+2HZTFJkJg6Cu8AKc1c7NUC+k+e9R
	 QFaOOB2CDNeHSIcCMR4uA3EQfQ9C0+P5C/CNQ6YxjgiklbnoVXdGjSnV5ZRopjLq8D
	 Tnzef4xJuZHrIgmBWjRGg0tbvkslpd4daIRVt8y4qy2YkBoEF11+mp13f4yBmK0srp
	 MO79zBoyIY7OTMU+Jha8CcTU1cEuAJGu79wCDuEXp9MkmVTwi56wAG0GkJfwhiumWt
	 ZdTCYORirQ6vw==
Received: by mail-io1-f45.google.com with SMTP id l24so1032871ion.13
        for <linux-firmware@kernel.org>; Thu, 14 Jul 2022 03:56:54 -0700 (PDT)
X-Gm-Message-State: AJIora/Mi/xJU72ycOd5LCyxdAa5Rw83/3NNkV9WtyjXoJ8ihaUenOhF
	OFZoByaS2XvWRRE1ya2riv2rGuVznzYl9WHvx24=
X-Google-Smtp-Source: AGRyM1sSfFm1G/vT6OW3BmyGqNQk6GW/VNNYO7NoTJROlSoSIBqXm+MRhUoBcr3E+VqBeps+viSEigE6XTFcyu4TmJk=
X-Received: by 2002:a05:6638:218d:b0:33f:5821:f84 with SMTP id
 s13-20020a056638218d00b0033f58210f84mr4655796jaj.303.1657796214122; Thu, 14
 Jul 2022 03:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PiK-65kT3JbpQdBPU0jMdHC_xXSNNGYmO_zDHq1odWYw@mail.gmail.com>
In-Reply-To: <CADnq5_PiK-65kT3JbpQdBPU0jMdHC_xXSNNGYmO_zDHq1odWYw@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 14 Jul 2022 06:56:43 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7Nme8JcT=OCX5_Ukw5qVHuQKRMSxX2p-xiPqr7wMsmfg@mail.gmail.com>
Message-ID: <CA+5PVA7Nme8JcT=OCX5_Ukw5qVHuQKRMSxX2p-xiPqr7wMsmfg@mail.gmail.com>
Subject: Re: Updated AMDGPU DMCUB firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, Prike Liang <Prike.Liang@amd.com>, 
	Chandan Vurdigere Nataraj <chandan.vurdigerenataraj@amd.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Wed, Jul 13, 2022 at 11:02 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated DMCUB firmware for DCN 3.1.6.  Please apply!
>
> Thanks,
>
> Alex
