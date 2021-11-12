Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6C5C433F5
	for <linux-firmware@archiver.kernel.org>; Fri, 12 Nov 2021 22:09:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CDCC061073; Fri, 12 Nov 2021 22:09:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B79D861051
	for <linux-firmware@kernel.org>; Fri, 12 Nov 2021 22:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636754995;
	bh=uMHd3LKOH3RDXUvW/orJwnr+o5R88cdUAt4i9w8f6MI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=c4rtuRW6jS/D5IXLIYNrj0gxL03LEttTufBCQoZEMHEp6M74mraGWYoDZYiHsuZLm
	 M13LOu47T7doHqpz4jmCKwr+9a3dvVRwI4L7fOCltvyh1LrdQRk/HSFYMSDEjjAJrn
	 FmbfQB1txxSiUIweCUaietOFLjolxtfGafCN1XW+IjAn1n84717X90F3XJS4bo/HlI
	 8qeMW7SIs36dW4La24maui+WhQ/oOPpSNhMy4igCAgrOT9ScS44cM5RLHXxC/PrUzp
	 HEd6iW81hN8Tl6x9132BdsirufkV9Sx90hyO4gz6MZu1s4CtEqdLdAV/VmUcZV+UTm
	 p1av0OasxxwSA==
Received: by mail-il1-f172.google.com with SMTP id h23so10359990ila.4
        for <linux-firmware@kernel.org>; Fri, 12 Nov 2021 14:09:55 -0800 (PST)
X-Gm-Message-State: AOAM532tPHJIGt5TRiRRYXTsVDn9vqoYonXVq3sRlhW4LM6XAChQrQph
	ryYPplDqTK1WcwSvF2T2MSEpfaYi31RCu6fwZkU=
X-Google-Smtp-Source: ABdhPJxZzVAHIsn0Et4xNc/ABwSJqhIH+D/X0tXPu4RjZ4tNwscAaOwGEcfU1QkbUaPGbMl+EPhJ808jt+sTdtJ55+Q=
X-Received: by 2002:a05:6e02:170a:: with SMTP id u10mr11108777ill.251.1636754995095;
 Fri, 12 Nov 2021 14:09:55 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_OJcbu8VbyR3D7TUWQV_TfYBRUukRhxni-dqR5GyY5gDA@mail.gmail.com>
In-Reply-To: <CADnq5_OJcbu8VbyR3D7TUWQV_TfYBRUukRhxni-dqR5GyY5gDA@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 12 Nov 2021 17:09:44 -0500
X-Gmail-Original-Message-ID: <CA+5PVA65MTmQVpUDzg5Ltqx5bsag3fWSQVHUxOm-g49=kPJMbw@mail.gmail.com>
Message-ID: <CA+5PVA65MTmQVpUDzg5Ltqx5bsag3fWSQVHUxOm-g49=kPJMbw@mail.gmail.com>
Subject: Re: Updated amdgpu firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.  Thanks.

josh

On Fri, Nov 12, 2021 at 2:30 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Please apply!
>
> Thanks,
>
> Alex
