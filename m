Return-Path: <SRS0=ZjuE=AA=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9EFC433DF
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jun 2020 14:52:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CFE78218AC; Fri, 19 Jun 2020 14:52:52 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E0CA217D8;
	Fri, 19 Jun 2020 14:52:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsRBydFq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E0CA217D8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexdeucher@gmail.com
Received: by mail-wr1-f45.google.com with SMTP id q11so9996031wrp.3;
        Fri, 19 Jun 2020 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nVbNGhweUQn4MXv7WialTvU+PSwfF86jM5544v25Pmw=;
        b=TsRBydFqbh8HsLC6C75j8qgrJ05pRnOsXtZy979PKg3BCptH1vhVHHJEca3D5oAuyh
         pnD7fG/1yqLmRQii6+BXeIwdBmfYbNIX58WDaDz80XVNOqUEuPNI1BHiAKkjMALSCHkX
         Y97pEam3gOHxCZUFpc/UqUKHf3dA8WD5ZHqAeWMg4s/N9UI3FBS07mvXIM8+9/lrINJt
         jL5SaKteieaiyx2ctroDeyb3xqyfXVAqr/xaNoMH1AwZV2PsNjk+NehKLkEru8s7Glrb
         xO/+7MVOiDtmD0O1lhW+gISbO2kgo5sSxcrVcg23ibQmOEIVpkFlRgwQovEBUVToMsdz
         Tj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nVbNGhweUQn4MXv7WialTvU+PSwfF86jM5544v25Pmw=;
        b=l2FlN6BAWbtzyGDB3A0HCDYA/o0BAM0bvD6zoxlLV1PimfB7Kchn7KP1IuOXTBK1ei
         HUMt8FV5RrwxD8ItKROslOeaiL3EtZPlhiA4EHk9sy5hWBkH502BP3bYSSHhzVMKjGrQ
         GJWZDaZaXiTX3nF7So+7pUU7HnJMvOIiBIw/PS7LwATJNKFJuLF6qBOuXNhA09zWbRKt
         kIx4r3vWTRZ5Jvd4UDcqDsmduOx3GuaOaa1PtcHO2My81YASfS34vSiN/iuxpg5+7rtm
         isvRvmx40diBOugh+uYznPz9YU/FDidTZbgTfbotmtE2ZAiIdDX/6bwOjHAWlc2XBDTX
         hBJg==
X-Gm-Message-State: AOAM530OFd/1c8/UvKGAC37ImRRB3E44d0cER0oA5GMoguDqTDNLXx3h
	VQJpjxSQXhP77MMOrwrCBQhIBV/tmjTr3CrxhE+fog==
X-Google-Smtp-Source: ABdhPJzOzbdJMaZExU39uNaLsfb4gJZrYqXdyt6FflSpV4dH9D2ZgIg/RJDA923Wt3llgyyxjkFIcOmd7uaNUGGRdbg=
X-Received: by 2002:a05:6000:1003:: with SMTP id a3mr4421585wrx.111.1592578370740;
 Fri, 19 Jun 2020 07:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_NiL9ErKKspDTY+Q3AnrgMxv5jXY79Zjw-vEVAmKQuERQ@mail.gmail.com>
 <CA+5PVA5=vzsH62YHQ-pUpv3bgB=piMLtxcjdYiRtTTr1o42NcQ@mail.gmail.com>
In-Reply-To: <CA+5PVA5=vzsH62YHQ-pUpv3bgB=piMLtxcjdYiRtTTr1o42NcQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Jun 2020 10:52:39 -0400
Message-ID: <CADnq5_NU+Z2qxDwSpwnwXgUF8dh3ggwAAugY8RZvJhMVBQc6Fw@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Fri, Jun 19, 2020 at 8:37 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Mon, Jun 15, 2020 at 5:48 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Updated amdgpu firmware for 20.20.  Please apply!
>
> Applied and pushed out.
>
> josh
