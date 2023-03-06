Return-Path: <SRS0=NYDC=66=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96240C61DA4
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Mar 2023 14:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C9F3C4339C; Mon,  6 Mar 2023 14:23:45 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C0FFC433D2;
	Mon,  6 Mar 2023 14:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C0FFC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5384ff97993so187257907b3.2;
        Mon, 06 Mar 2023 06:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678112623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YLVtN+0Tn7PLXdPaEU2dbd1d1fC/fgz2hrANuu8iUJo=;
        b=Pos+UdOZ1cGP1bLmN7tjkupTrDmiO1bFou4C/lVK9Cw9P18Sr1Ka568F10dwDHGWxL
         YPhgJeLj9ZGJUzCErRh4fRlrtVPZVMdgG7YwkUiRqanuMtRvTWkjz8RU204xV2M7r32L
         cgsz/dH5ZxGRaKJNpmavmP91ICMgBe+uPfqCoo787qGmPKk77PA7H6eHIgXxShexwTqc
         gc93+z0jAJcHL4FyNUhUiDAyZB3tYUhZUGfQWvnqwVlG5ecWqZvn7DZB/OAn4GX959T5
         sWjKOixsJxnmZNLRPk8A7kA0u3wpoyjJFKGj3Ay0Zi+kvV/Xb23PWY1pHetpOy2sY3cP
         UGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678112623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLVtN+0Tn7PLXdPaEU2dbd1d1fC/fgz2hrANuu8iUJo=;
        b=NWHXLV9hNKAqkC1Lu4Xh8noa/X8JmxALJqDKGwO7slU7U+94c4T0+TwCLSMIDqE9ip
         w6TtSt5XKgmBeodrnGhrwRcnyWabTjYbWmqj4uTHANtZf4tS9CiA29yzOuZeSlH3ow4b
         46cDSmkK4ee3NFI0VjXmqgtEZa/RSkl04n9Cf9Vwy6l12q8LKNdMBAZD19DtlPdVKrUe
         Iv3bDlhLc+NyeQC8EJL/HHNeJeE7mMJ7S/t9nXhgOh0reAZ2r1XT300QIFTSM2+Fwsai
         5OP2DyrKUDDXtPerCuw+MiqZFxa7X0RAIZ6G4TUj2WbsnWfW2KiB67aOFkt0zM1QDi3w
         P5LQ==
X-Gm-Message-State: AO0yUKW4dy8TI7Hjkgx652trVjRga19ZhNAwHWNkpRahYGAJAkPOet/V
	wQdCeyn3ReOTlemVytWEFbkfp58lABgu7q1F5Aw=
X-Google-Smtp-Source: AK7set9GRox7+GGUgmp3foVPd53Os0FLWPB1DsOev0xuPyvH/BIfCTaVXU0OI/tZgIGJqkXxeOIfxiF84O559Jb4wtc=
X-Received: by 2002:a81:ae62:0:b0:53c:6fda:b469 with SMTP id
 g34-20020a81ae62000000b0053c6fdab469mr7030377ywk.0.1678112623449; Mon, 06 Mar
 2023 06:23:43 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com> <20230301-fixes-and-compression-v2-16-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-16-e2b71974e842@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 6 Mar 2023 14:23:32 +0000
Message-ID: <CACvgo506K7xqEjsQ5Gc1bWbodSzbp4TEtwuwfYv_9o2C7XQQdw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 16/16] Makefile, copy-firmware: support xz/zstd
 compressed firmware
To: emil.l.velikov@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Josh Boyer <jwboyer@kernel.org>, 
	Adam Sampson <ats@offog.org>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Mar 2023 at 18:56, Emil Velikov via B4 Relay
<devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
>
> From: Emil Velikov <emil.l.velikov@gmail.com>
>
> The kernel has supported compressed firmware for quite some time. So
> let's add a couple of targets to produce that. In practical terms this
> means it we'll use ~5x times less space on disk.
>
> Reportedly the amd ucode, needs to be uncompressed _within_ the
> initrd in order to work. Using compressed ucode in late load just works.
> Ideally this will be addressed by the initrd generators, but considering
> the files are tiny in size let's skip the compression.
>
> v2
>  - commit message, skip compression for files annotated as Raw
>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---

David, does the updated patch (or the rest of the series for that
matter) seem reasonable to you?
Josh, is there anything I can do to move this forward?

Thanks
Emil
