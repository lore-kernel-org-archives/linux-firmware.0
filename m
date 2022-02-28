Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8214CC433FE
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Feb 2022 14:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E4A1C340F0; Mon, 28 Feb 2022 14:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5969DC340E7
	for <linux-firmware@kernel.org>; Mon, 28 Feb 2022 14:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646059490;
	bh=1Ryp6fsC+vEBV/v6YOPjqZ6aBAos8bZ2MgC3cZIfnLg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qcx1CEE2FGJ55khWfrY6gcMe3Q0Dyl2ALtkXuTMARYDsIrbmwP1vcnMjsVZECTRGe
	 fsRyDJw9akrV1VZpG6pzmunfFs6uqdfOjopfXCsIdbIpPr6NQzx41RncPbVfhHn6lT
	 YbXWdGxV0j6YU/fcCHKxkCWXMz/XxRDhy9EecLiW9WwXTyxplsrgjv5Km66mN7qsh8
	 qCmTZ+4pyTjqHF1bY8lJrHGef+uc73ngvipDHwRiaYqTkLHsnH+Vu/pUHX9jKsTfLA
	 eyhklBIc2O3RfQPd46UOZa9a1yvFddlYBEfDAdXc6VdhGl4SxI/W02VRXgZXeGfU2t
	 3fDHPo5uQ/5sQ==
Received: by mail-io1-f50.google.com with SMTP id d19so14873110ioc.8
        for <linux-firmware@kernel.org>; Mon, 28 Feb 2022 06:44:50 -0800 (PST)
X-Gm-Message-State: AOAM532hY/FJcYTGjPQTxGsP2kI3WO3qDhxcZTyEqsEHoAnmyo3/b/8w
	jqz/eoFTeyCwLFRmaVxujEf9H8do7D+P9kZCZnU=
X-Google-Smtp-Source: ABdhPJwXncOFGhWnV0XpMVPrIJT6qDtDqqxzwSapUC3qBmiFp4WNOAUOSP7OWUfdz/Oav1eEG9/tA63SNa2yFG58OZA=
X-Received: by 2002:a5e:9817:0:b0:641:5b49:b8c5 with SMTP id
 s23-20020a5e9817000000b006415b49b8c5mr16125610ioj.179.1646059489586; Mon, 28
 Feb 2022 06:44:49 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_PYhDcR3tNYgzQ-uz80Nf++oMPsF3=huK+qcGntiY_LQw@mail.gmail.com>
In-Reply-To: <CADnq5_PYhDcR3tNYgzQ-uz80Nf++oMPsF3=huK+qcGntiY_LQw@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 28 Feb 2022 09:44:38 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4ThYSp1zV7KRNqQ+9Y7_9OsNf+=HGy5KNRoUW_9Y-hhw@mail.gmail.com>
Message-ID: <CA+5PVA4ThYSp1zV7KRNqQ+9Y7_9OsNf+=HGy5KNRoUW_9Y-hhw@mail.gmail.com>
Subject: Re: amdgpu VCN firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Leo Liu <leo.liu@amd.com>, 
	Sathishkumar S <sathishkumar.sundararaju@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 25, 2022 at 12:02 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> Updated VCN firmware to fix memory clocking issues on some laptops
> with old system BIOSes.  Please apply!

Applied and pushed out.

josh
