Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8154C433EF
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Mar 2022 11:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E758C340F0; Fri, 18 Mar 2022 11:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83EEBC340EC
	for <linux-firmware@kernel.org>; Fri, 18 Mar 2022 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647603384;
	bh=Tmwk8Ov1Lrp3z76wz4G0/+XX+oiH2UgMPmL989tVJwo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=CgQ3pOYqEKJCfIFJFSTxnRYf74FgXfMODVZ5gAygBYFlb9WqsFZaogXT5pmIZYwtB
	 V/LAkba8geo+VHopBUpZdWH0oE0RTzGUS6oX+L4RL1apvpnWXZbi+JNluuhQIFXRlu
	 7BC9+o5Qpl9s5Yc/zwGC4p8twUjrKJwSkqD0kG372BeV5/hKh+LoQC6qqfMsSx6qD3
	 hf2M6mVIbFt4bjixlxf5BkAJu899nooVd3xI3x8LuanUnwyuiVgZmakIfBrG7nDwCB
	 XA/7uzPc5Aw8eDdShOhqP1mF3gzvHXl6PxahAfPuvc1svlOWLZwnrnYf/7FkF2LS/u
	 +U9YJrzuymXMw==
Received: by mail-io1-f46.google.com with SMTP id d62so8907521iog.13
        for <linux-firmware@kernel.org>; Fri, 18 Mar 2022 04:36:24 -0700 (PDT)
X-Gm-Message-State: AOAM533aKIuNuDZet38PbvlGoCSIYCY2fVfQkhkMWwS+BkdTDjVopn7O
	tTpAS/V7ExQStKy+Jx9xpGVm21DAILRbLky6MfM=
X-Google-Smtp-Source: ABdhPJw45uOJ1myi+QPPO5/3gh+gv1cTpinAtchBIVfkULoT+FPUOmZCrX3424kGaPOQcrwOXHwDEve+X8Y4k9HLumI=
X-Received: by 2002:a02:350a:0:b0:31a:1d7d:1f76 with SMTP id
 k10-20020a02350a000000b0031a1d7d1f76mr4095253jaa.144.1647603383682; Fri, 18
 Mar 2022 04:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_NLrOb26ZFW8R3ZYuDEvUzHyLYmNTnSb9jgthBLHw80iA@mail.gmail.com>
In-Reply-To: <CADnq5_NLrOb26ZFW8R3ZYuDEvUzHyLYmNTnSb9jgthBLHw80iA@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 18 Mar 2022 07:36:13 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6Eiu48qzmoAtFjQyBc-wXbnjkDomFXnDgmSvUhE7fgSA@mail.gmail.com>
Message-ID: <CA+5PVA6Eiu48qzmoAtFjQyBc-wXbnjkDomFXnDgmSvUhE7fgSA@mail.gmail.com>
Subject: Re: Updated AMD GPU firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Both applied and pushed out.  Thanks.

josh

On Tue, Mar 15, 2022 at 1:24 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated AMD GPU firmware.  Please apply!
>
> Thanks,
>
> Alex
