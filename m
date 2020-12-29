Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C18C433E0
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Dec 2020 13:34:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6CE5920867; Tue, 29 Dec 2020 13:34:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47C62207B2
	for <linux-firmware@kernel.org>; Tue, 29 Dec 2020 13:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609248876;
	bh=fqGWbhBkGOZ9u04yqQuBO/sSM5LMA2QkoO64inDEiCs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=E24YTRLLrJK5DCl+tadPUM64KOioDtXi41LA3p2D31fsoFUETJ0ml7+C+hyyK3xpR
	 19qAqKz9PxafXlYrD8eieSb4+Dd/lRZzcI1z9URFmQ3KfKDi3/46Z5WegaSJLBJ4oF
	 zPPJe3Tgcq8VF+mPup2Q1hYOV+LSi/r38eED5iqkSP3KNu0W1tyYgTO6740jT9x/kP
	 c6oWLfhcf0ih/Tyf+Bx8/nudzbqYnjYaefa9wlOsB7T9EafPfwLyBoIecyrVz1n1fx
	 XKAbxMq7lYxl0YBEBAU7gOrdDVG5DT4VVAsEUrwuNG78xlIvtW982wV0muMfHD4EoW
	 h2grK9fzph0BQ==
Received: by mail-io1-f49.google.com with SMTP id m23so12146605ioy.2
        for <linux-firmware@kernel.org>; Tue, 29 Dec 2020 05:34:36 -0800 (PST)
X-Gm-Message-State: AOAM530LH2oZQZ/RR8Qq6xNl7w+nnIf8v8S6VLU2qPSC/B/CwqMLEiYL
	nXZpTemauSbBhnKNUr+Era1apxA/qaGs/f3UgwM=
X-Google-Smtp-Source: ABdhPJwsFmWP3n7NzDXVxmdGx6EXzSFLHZFnISHfsE4g2qnrUFhoZp5HC+469d73R0uPql9jn7sAAqX3pLJf25pmrQs=
X-Received: by 2002:a05:6638:83:: with SMTP id v3mr42419042jao.106.1609248875768;
 Tue, 29 Dec 2020 05:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20201228200756.461ffd32@tiksi.ru>
In-Reply-To: <20201228200756.461ffd32@tiksi.ru>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 29 Dec 2020 08:34:42 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7hzePr271u1bVi+ESaHpNFybWVkgWnsOvWU1NqzJWJ+w@mail.gmail.com>
Message-ID: <CA+5PVA7hzePr271u1bVi+ESaHpNFybWVkgWnsOvWU1NqzJWJ+w@mail.gmail.com>
Subject: Re: Realtek RTL8723BS and IEEE 802.11s
To: kashcheyeu@tiksi.ru
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

That is up to the vendor of the firmware.  We can only accept whatever
they submit.  Your best option is to contact Realtek.

josh

On Mon, Dec 28, 2020 at 12:36 PM <kashcheyeu@tiksi.ru> wrote:
>
> Good afternoon. Could you add support for the IEEE 802.11s standard to the firmware of the Realtek rtl8723bs controller? This controller is often found in laptops, tablets, etc.
