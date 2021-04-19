Return-Path: <SRS0=Yt59=JQ=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF3CC433B4
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Apr 2021 19:21:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3453561354; Mon, 19 Apr 2021 19:21:24 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3B506135F;
	Mon, 19 Apr 2021 19:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3B506135F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexdeucher@gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 5-20020a9d09050000b029029432d8d8c5so7704657otp.11;
        Mon, 19 Apr 2021 12:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NsToP6fE3KmmDafS73BHYsEnsA+IG6BNeX3PMw4Ytl0=;
        b=B46Sso9g3/y3QJpv5Ky40mYI03ad+1nPqqfGQTYr7zS7i8LtSj4RmMcJ+EOGazWl5r
         /CDfsPONnvbOakJ5CVEL3i+JIRXFLcFIaVLqj95yz5qTw2Am1sS7C1bHknfXOnuFaoSS
         F88sgRbrsleB9KtQSz+ne1m/1XNTanVgfjkyMy3DYe4bnFXAd9ODr2Xjur1NiGPP+L/B
         TD3AhHJOr6ckypQrE7WyLzOvL6WzhsD2B9L68oNglTToef5ZN3peN2sj0NZFYrIvjmei
         Cb6mmnqaQHPpNNMcib7TmNblI+OMFpWdaRA61I7GyN1USDApCjpE+/ek54olczdGL2NG
         eQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NsToP6fE3KmmDafS73BHYsEnsA+IG6BNeX3PMw4Ytl0=;
        b=BizHyw6qUQepuF3VRZYJqMhQF2JilTt0H4xaFy1ewdlb3s4gwNFtnac4XgWFusdQpl
         HJCqDYuVTL9Yzc9Wu45c6uCuCZUpaLbzUoOhJbL1AUjY5KjIydPhBOyY9DisgusqbfK7
         Jp0YC7vjlIyCvWVAFx5EkLqwEfS+zI8K8CsEgbzOugty7vHq7tenoHT6MoHTGAzQnoss
         8mK5sofI0ybxiHSa3vDqH04fJj2dB9CDm9p9IcXhZkPJrT2PCNHoyT/ZykzpM0nyK7A/
         GbSjeAzJQqSmtO47dSumYEdtoEnmeVKHGkPu9y9wcCD1iQdVWHb+DfAv85Ty61UC4rhn
         A8tg==
X-Gm-Message-State: AOAM530aYlA2m75Rirx5zYeE95Ja0AhXw2PMfRLJ2Ip/QY6cYavwrNEV
	Q0rvTgvLJWY4VL3bP1W0n7ibhtKyv8Ze0/omqL57RF/KKb+QNQ==
X-Google-Smtp-Source: ABdhPJyOIFgyVMTHPg9v2IYIrD4WURS/bqzJBgtJvaUBSkhOONEAZ07HWc1KZwoNVqHe/oCPLrHbWkwYg7ZeHh+cOvY=
X-Received: by 2002:a05:6830:15d3:: with SMTP id j19mr6487784otr.23.1618860082934;
 Mon, 19 Apr 2021 12:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Pd5kfpiPa3T7d5XFqkFZJYzHHbVPBmE_kCqG2dK8wQcg@mail.gmail.com>
 <CADnq5_MiQzPbtL4z7kTUV37-nJ-FoJYdDq8K23c33m3Rpg643w@mail.gmail.com> <CA+5PVA5F7jaypkz+4f4ao0g=t7gJfDPYST3=Emsid47O=zvv0g@mail.gmail.com>
In-Reply-To: <CA+5PVA5F7jaypkz+4f4ao0g=t7gJfDPYST3=Emsid47O=zvv0g@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 Apr 2021 15:21:12 -0400
Message-ID: <CADnq5_MrRt55MvEQbqLxS_-MH__6g1npJM8z4Rt7fKFQjFD5oA@mail.gmail.com>
Subject: Re: updated amdgpu firmware
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks!

Alex

On Mon, Apr 19, 2021 at 9:49 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> Applied and pushed out.
>
> josh
>
> On Thu, Apr 15, 2021 at 12:28 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Hi,
> >
> > Just wanted to make sure this didn't fall through the cracks.
> >
> > Thanks!
> >
> > Alex
> >
> > On Tue, Apr 6, 2021 at 9:15 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > New SMC firmware for navi10 and 14.  Please apply.
> > >
> > > Thanks,
> > >
> > > Alex
