Return-Path: <SRS0=nhnl=VK=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBCFC433EF
	for <linux-firmware@archiver.kernel.org>; Mon,  2 May 2022 15:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5FB4C385AE; Mon,  2 May 2022 15:59:35 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3ECCDC385A4;
	Mon,  2 May 2022 15:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3ECCDC385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id m25so1706979oih.2;
        Mon, 02 May 2022 08:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CZZ2T8ehEEUS5/SxX12xSdG/cM9TNnims4EQhJdlhGc=;
        b=ksiKyOf6F2VF7LKUq8QkZ3OFYZPlqfPKNYzEjvf4PvWqbmFwwuodBYdp9xeqAuB/iT
         f5krbHnaj3WAhDfyzOIaP0LVWVTPIkZNB3EcU8gfUQ/wZxuNkUtq56n1vSYoEx6dld5v
         EVTXnfuvBiM/nX92WYR7MYIhP2t8rToxcahUUoVWNqVPJEEju7kUZ+k1HsKSndBTXh87
         hp2glHtB/wzzH1O+lDPXeIhys4cNYXHLfdDlETzLO0zDjk3KsaVog9HXhkgl/NHtfN65
         nk2KFhuCwmBTLox//AvG478e147HD7XRhyBB38dfDZbM8T+Lv6hSHlg+n3o6SU5YOcXK
         GnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CZZ2T8ehEEUS5/SxX12xSdG/cM9TNnims4EQhJdlhGc=;
        b=6cSwa0iy9mrYrd0KFVeYepX+UI79aMMYEp8W/qgpPDzOgGcbVK4PGZ02VMDJIwwcrJ
         cSvpqw8kOTJSidja0g/aXH+wToJjxXYclK7imCcObgc9kh9InK3s/XixCFTmbv7hTOr5
         +oUiCqF+lw0oLwhLPrcTkbLd2+SOD4/ZbIbwuaIIk96OMjuovg90YcY78Lor4Y7uoosD
         sBhxmSfeg88YMC/g7RIEGEIMOZ5S7E8bYgqLG44b2DAhsFnxBZKzG0h9I1RKN+Eg7ozY
         O7lXiYBergeaonzTJnEkhc6JmPk7kGwQKQ4CRn8sTdc10FTIpUIcD64cBJKAE532Vrwi
         WLJw==
X-Gm-Message-State: AOAM531NHSWHh0LHMWeXohT6j2eHCtaCJJgG56I2mOU56po/JK70tJbk
	XCrlJoUVfgPLK3dJlI2ev9TUI7/GlZms6e6QXRdpZYkG
X-Google-Smtp-Source: ABdhPJyVP3/u9zEIOtEJPvsSeBPh026wkdQjcc3WMuZUN0Yf/qkGJ6toJzBKlghb4hmzQPnbxFQzFNFDhOL3HmFusr0=
X-Received: by 2002:a05:6808:f8d:b0:325:1e81:ffe5 with SMTP id
 o13-20020a0568080f8d00b003251e81ffe5mr5935640oiw.253.1651507174312; Mon, 02
 May 2022 08:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_P65f99akcyui5K7jziE64pEDT-Cajgau8c4YUa3bVNQw@mail.gmail.com>
 <CA+5PVA44VCZLE8-thxM+Wp1H0PNug_B=D-7O-bFGgDxhsjcdWg@mail.gmail.com>
In-Reply-To: <CA+5PVA44VCZLE8-thxM+Wp1H0PNug_B=D-7O-bFGgDxhsjcdWg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 May 2022 11:59:22 -0400
Message-ID: <CADnq5_PMXLAW-FZ+HtnhbfumwyOBf2KGrEZjMj4OYQpNSaJPeA@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Deepak.Sharma@amd.com, 
	Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Mon, May 2, 2022 at 8:26 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Tue, Apr 26, 2022 at 11:16 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Hi,
> >
> > Updated amdgpu firmwares.  Please apply!
>
> Applied and pushed out.
>
> josh
