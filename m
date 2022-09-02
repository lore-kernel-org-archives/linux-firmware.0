Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B65C54EE9
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Sep 2022 11:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07A9CC433B5; Fri,  2 Sep 2022 11:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5994C433C1
	for <linux-firmware@kernel.org>; Fri,  2 Sep 2022 11:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662118115;
	bh=zVgZN4WL3C6OKo3uQf7qYJgQ9H//NbdYJlJEx9NI0Mw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=APcR6GSdZpDp6XtazdxhiCv5PScrs6GxwIxxFT/N6mLYRFrDJilksWmX56gUvmVo9
	 222mdyadbgqoJ9ZTinthYxUS/Z+YTxsuWUHT0NT0P/uBGzeysai7czJdEmyWAVT1u6
	 AdLZAquxwIC1aX4wB+kmqAzHlp6XBNLDzfAick+bKySD8Q4nAeBnG7Pc0JxEoJ2C6B
	 gOCqUjeImTxLYp3f2CV+4HqF87HP8SoRUugC39Dn86GJ9sjeKjLGPItVF7LZSkhQdl
	 kRugJy+tf7LLpz3zL/UR2NDm5X4o6ekTfWty8HNr057SRyitsADmttZ5vxURH+y3U6
	 eyoe+crJO07Ow==
Received: by mail-il1-f171.google.com with SMTP id k2so958942ilu.9
        for <linux-firmware@kernel.org>; Fri, 02 Sep 2022 04:28:35 -0700 (PDT)
X-Gm-Message-State: ACgBeo01TPk/m/Aum/KJkqhunvDLVok5RUZxBTbfE98eaDO8vvTST99U
	YBQkLrFtdbCFo9atoOzC4KG/ZvzwciYxH2UP6Uo=
X-Google-Smtp-Source: AA6agR5aQf4uVaDZ7pycoD4sSaMvaKW2Tq5aD4Tnw7WbtVC2Uf0/jzv4CmbkCeFjj+/5JyH/HqpHJ6KoZaZm8TamYTw=
X-Received: by 2002:a92:6903:0:b0:2e5:8f47:22e0 with SMTP id
 e3-20020a926903000000b002e58f4722e0mr19285697ilc.97.1662118115066; Fri, 02
 Sep 2022 04:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_NXs97tKmtYJ2ieMXW2jLTgCX=g5fLqnX7+Ve2vgi_nig@mail.gmail.com>
In-Reply-To: <CADnq5_NXs97tKmtYJ2ieMXW2jLTgCX=g5fLqnX7+Ve2vgi_nig@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Sep 2022 07:28:24 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7PiR7G8VkcpdOsbX46=Hj=dmmVWJnX1yrzhgJumk575g@mail.gmail.com>
Message-ID: <CA+5PVA7PiR7G8VkcpdOsbX46=Hj=dmmVWJnX1yrzhgJumk575g@mail.gmail.com>
Subject: Re: amdgpu VCN firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Leo Liu <leo.liu@amd.com>, 
	Boyuan Zhang <boyuan.zhang@amd.com>, "Dong, Ruijing" <Ruijing.Dong@amd.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Wed, Aug 31, 2022 at 5:39 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated VCN firmware for RDNA2 GPUs.  Please apply!
>
> Thanks,
>
> Alex
