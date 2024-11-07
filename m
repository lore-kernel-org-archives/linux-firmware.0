Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABB3D4335D
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Nov 2024 13:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A7DFC4CED4; Thu,  7 Nov 2024 13:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F4BC4CED3
	for <linux-firmware@kernel.org>; Thu,  7 Nov 2024 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730986221;
	bh=EdUHy+dJaT2hjot9BfU5nIFtHsjfeKtMy7/W74D8iDw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=jT8EEkG2MOmhdwILypbKO2JgvVuLL2Z3GlKsn3sB3HnrOK/NxM4eMCj9BxtAplynJ
	 O9xUxyYAzeE5w1d9poy4UgUq8HEXGvDNcsjlmvjTDOkZWqoLHIr3dyE2m9Z77FMvZA
	 CwloSZwyXOzpiSTXq+lkVccIVcZgXfSb+EhCYQG/6tBJRhPOnXNE4IIb0o1vEkxZf3
	 3gNdw1omujeObgVIzeJrkvQez17sN/PqjiqKH7oU0pr05gVfLwndSKa0/Na5Sj77aI
	 nuLGJxH1TQLw7M/KmIbIHI4qd5r53hc6lDzxe6uzFYOJdan93GecfgfqH18zBOeQkP
	 HAIKjy0KFJhBA==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e30d517c82fso963019276.1
        for <linux-firmware@kernel.org>; Thu, 07 Nov 2024 05:30:20 -0800 (PST)
X-Gm-Message-State: AOJu0YxqOvnG8fJO3ptanqw+51i4JTzpDVcVIyEtYdKsbSjDh53zPcbW
	9C/kys7DdsjMEWynxTmw1/tkHGIGQzy1zCh636kb7ZyD2xRP4ELXNPPQVpGviGFBHcAVvzJCSBg
	Ec9IFIgk0ztImmwTM7RmvlY6ZjoY=
X-Google-Smtp-Source: AGHT+IFqE9SiTrIbIR3jW1Lp8HrntjO9jRGgJASZJSv9BBpyfB81D2bbgfkCGLbvPr1HXnR0Wyz0hNG1id8V5iS89dU=
X-Received: by 2002:a05:690c:48c4:b0:6ea:7861:799f with SMTP id
 00721157ae682-6ead609d958mr12503357b3.38.1730986220252; Thu, 07 Nov 2024
 05:30:20 -0800 (PST)
MIME-Version: 1.0
References: <20241107004830.14261-1-zenmchen@gmail.com> <20241107070707.1438-1-zenmchen@gmail.com>
In-Reply-To: <20241107070707.1438-1-zenmchen@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 7 Nov 2024 08:30:09 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6u5hnYf+5Z7MP1oJPF-ubETiY5oPPJDpa4FPjdAvKgtA@mail.gmail.com>
Message-ID: <CA+5PVA6u5hnYf+5Z7MP1oJPF-ubETiY5oPPJDpa4FPjdAvKgtA@mail.gmail.com>
Subject: Re: [PATCH] rtw88: Add firmware v52.14.0 for RTL8812AU
To: Zenm Chen <zenmchen@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	pkshih@realtek.com, rtl8821cerfe2@gmail.com, usbwifi2024@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 2:07=E2=80=AFAM Zenm Chen <zenmchen@gmail.com> wrote=
:
>
> > This file contains the firmware for RTL8812AU and was was extracted fro=
m
>
> Hi Josh,
>
> I found I typed one more "was" in my commit message, could you please fix
> this typo before merge the patch? many thanks!

Fixed.

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/358

josh

>
> > the vendor driver v5.13.6-23-g232107d9b.20210820 from
> > https://github.com/morrownr/8812au-20210820
