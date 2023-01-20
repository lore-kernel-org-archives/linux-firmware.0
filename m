Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95F5C25B4E
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Jan 2023 13:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B86AC4339C; Fri, 20 Jan 2023 13:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7638BC433D2
	for <linux-firmware@kernel.org>; Fri, 20 Jan 2023 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674220361;
	bh=ZBbZy3UYgDDdJeaH5QijDXKvJWXVVa3eddEsxRaqPnA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nfF8rl5EkHhfk1qB5mhP6fAwkjGweHF9NqvsXzPicNGYBzKV8XsD7WT7xoh5MCElb
	 vC24lytvYbThxielaYHtacsKhkfhE42iwVyM2RjDqiYG2sJur5C53XMFIThVWwrMnM
	 mAYJDCOhP0OWMz9l0PQeEnrXjJ73mAoNuAek+OEHNDYnINr88vI0JSiE8q5SppyPCp
	 x9EpqFft+Tqjqu5FQDTuzCZ7p6DTME2vK44+Z44qOA4PKSIQLO553UbKODJ2JL4xjv
	 mMwda4yaozUVK8wmjSRBqziuezzdeGp+9KuT6UOSso5jeZulNoKHtkuwBahppq1eE5
	 WaHlr85PPdHHg==
Received: by mail-yb1-f173.google.com with SMTP id b1so1333867ybn.11
        for <linux-firmware@kernel.org>; Fri, 20 Jan 2023 05:12:41 -0800 (PST)
X-Gm-Message-State: AFqh2kqL20TLf0hunHuKzwPg5QS+q9knMnO5jbRca3GslZejQWFfXNsf
	aiw1AFtS87l4u19zWQ7ZlQ2z2+nao1tMDH8EAKI=
X-Google-Smtp-Source: AMrXdXvO1Qqvv22sLE2q6LReW433bNUIjvV5Y6sOhiTv2nW5JawSh997Ix7nSOP3fDA3+DmXnz/jAPhMK7xbnd5xCoY=
X-Received: by 2002:a25:904:0:b0:7d7:e469:372f with SMTP id
 4-20020a250904000000b007d7e469372fmr1502743ybj.528.1674220360501; Fri, 20 Jan
 2023 05:12:40 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_NHs3uHD7gGPDfxVhdTD__9CXvnPpzcdeRx5vHzTATfoQ@mail.gmail.com>
In-Reply-To: <CADnq5_NHs3uHD7gGPDfxVhdTD__9CXvnPpzcdeRx5vHzTATfoQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 20 Jan 2023 08:12:29 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7djMLHGiTbCgE8Kwx3dZK=oRbLGkKRDzw7-mpV6ZSaHw@mail.gmail.com>
Message-ID: <CA+5PVA7djMLHGiTbCgE8Kwx3dZK=oRbLGkKRDzw7-mpV6ZSaHw@mail.gmail.com>
Subject: Re: Updated amdgpu firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Thu, Jan 19, 2023 at 3:04 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> Updated amdgpu firmware for vangogh.  Please apply!
>
> Thanks,
>
> Alex
