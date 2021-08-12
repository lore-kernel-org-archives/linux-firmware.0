Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE1FC4338F
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Aug 2021 13:22:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4BC1E604D7; Thu, 12 Aug 2021 13:22:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3624A6109D
	for <linux-firmware@kernel.org>; Thu, 12 Aug 2021 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628774565;
	bh=f/UNa6qHjxkS6YplKjcjAGCInp8DulT7vVakfmFgkFQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=aJmR4nzhyoBqrpchrucJSXLpAEv9jWnfUqdPxFQV+NERDv51wsuaVoMaEgAguZY8M
	 7rVvpf26F6q6pEydHfZG5o1DzSQHm30X+sENIVydJWQHjJMrxnH9zJeWxaN2erGRJE
	 sN8dmB2Le5LgkNeIGakdmnnLS0tjR7dOKRqoOE/RlzihNMPsD6Rwd0DB7ptYYW7nZt
	 a3UneME6oKsjXfBOidxzREthcK4ZLrBa7AoyinpFuNKzFwZX2wZjk299XJmFTF8Ckk
	 8So5IFaYlpwRk7EkWHuTBo0RCt9J18gRkAHPhFKemXo0ArHRkEWs4XYoVpNEO0sRqB
	 zV9DHxr5HVKVQ==
Received: by mail-io1-f49.google.com with SMTP id r72so8344117iod.6
        for <linux-firmware@kernel.org>; Thu, 12 Aug 2021 06:22:45 -0700 (PDT)
X-Gm-Message-State: AOAM531tIOR4s/WRARQu/auZIF4Rx6DBZ2AwUnCzTrTZtFb33bZjc5d4
	McdAqvXaVtmoqV0z5wI1RSN+zr1C82+vO5Z3SBI=
X-Google-Smtp-Source: ABdhPJzEZ6vTPD9ElclRZDZoATUg+854KbdjVUWTz5UXbJ2alygM4kMoZQhKoqaSXEmUWmrArcCffjk7yadaglChWOM=
X-Received: by 2002:a05:6638:1036:: with SMTP id n22mr3770929jan.81.1628774564685;
 Thu, 12 Aug 2021 06:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_OA2C=yQfgtrhU4Gw5vYRXPUyPyPc+AP0qPsKQ41PUULQ@mail.gmail.com>
In-Reply-To: <CADnq5_OA2C=yQfgtrhU4Gw5vYRXPUyPyPc+AP0qPsKQ41PUULQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 12 Aug 2021 09:21:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5PwY0FiK5CRfBp_Mj9QDkX2VOV=8qm2uVUTJk+hSR4xQ@mail.gmail.com>
Message-ID: <CA+5PVA5PwY0FiK5CRfBp_Mj9QDkX2VOV=8qm2uVUTJk+hSR4xQ@mail.gmail.com>
Subject: Re: AMDGPU firmware updates for raven APUs
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Wed, Aug 11, 2021 at 5:30 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> Updated SDMA firmware to fix stability issues on raven APUs.  Please apply!
>
> Thanks,
>
> Alex
