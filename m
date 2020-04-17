Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15F0C2D0EF
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Apr 2020 15:27:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A2EE320936; Fri, 17 Apr 2020 15:27:19 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 83014208E4
	for <linux-firmware@kernel.org>; Fri, 17 Apr 2020 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587137239;
	bh=Q3KhphNfxVaNzlOfYnCrBHz7BfK+hb4g9xrFiHz1ctA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TGV+NKqBe2HEp4WiD/K04ePRU1dAtqOouVxvKau84fGhSIwdqb61Wgp0bdXYUB4zf
	 EgdihiJ2gxRleitSV0xUtJS/OuaRYIvXYxiWK1m/qZWAqecrqQDFa8whvoJ/hZhy81
	 km7qytNYW9KZ4vP2FrLhRO2x268nF4RA3v4QdYlI=
Received: by mail-il1-f180.google.com with SMTP id u5so2496836ilb.5
        for <linux-firmware@kernel.org>; Fri, 17 Apr 2020 08:27:19 -0700 (PDT)
X-Gm-Message-State: AGi0PuZzT8nBCY1hdpvqYrfYQXSFC849UHy/faFb0nQNxZt9PUpSxyNV
	yrp26pLk6tUWjkU7Q3gltgFGGeld7Fl55ThNQhM=
X-Google-Smtp-Source: APiQypKsxtt1DP1c/mmjT8LE8cgJDnVZphLZqpekXcLHhSdWW2vzYalr0wyXmNxW8yx+BVUOHE8LUkpAdduiB3Vuy2Q=
X-Received: by 2002:a92:5fc5:: with SMTP id i66mr3534439ill.303.1587137238878;
 Fri, 17 Apr 2020 08:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Pm_HJSM4Op1zyYUvoK2VN5=+ZnrkwqtYZPGOwiDjasPA@mail.gmail.com>
In-Reply-To: <CADnq5_Pm_HJSM4Op1zyYUvoK2VN5=+ZnrkwqtYZPGOwiDjasPA@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 17 Apr 2020 11:27:07 -0400
X-Gmail-Original-Message-ID: <CA+5PVA71rohy0emh+aJCs80M5C30sn7A_gcKierCd2ASdf0GAQ@mail.gmail.com>
Message-ID: <CA+5PVA71rohy0emh+aJCs80M5C30sn7A_gcKierCd2ASdf0GAQ@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 16, 2020 at 4:12 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated amdgpu firmware for 20.10.  Please apply!

Applied and pushed out.

josh

>
> Thanks,
>
> Alex
