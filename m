Return-Path: <SRS0=UIe3=SS=googlemail.com=nix.or.die@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40647C433EF
	for <linux-firmware@archiver.kernel.org>; Thu,  3 Feb 2022 18:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12F80C340F0; Thu,  3 Feb 2022 18:42:10 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CFABC340E8;
	Thu,  3 Feb 2022 18:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CFABC340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-lj1-f181.google.com with SMTP id e17so5203157ljk.5;
        Thu, 03 Feb 2022 10:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+69gBDWXDsmklsuisXB2PTXgsG2vWmN63+2DybJAvcs=;
        b=C2Xt4eLlGESw1octZqyAjcJCmSbuxs1NQ9Y0UXgo0+kzShFcOpd7GV2IoqN8ifDtns
         I0vX0FXMduKIpeXsUcNC09fq7rzSiDB8pXvYRexNFb1cEOx9xG0CAqYEyMaN+f/WKIZP
         mNgj6e+dqz1sKg61RY6Fsf8j7b9IOiMArhRnI8xWcQ3b2ZH4jFB49AZCSOBJNzdZF0KL
         ed/GZYcA5DK0MMB8jNJaob3OgPWbw9iIS4XKSuT17N6OSlq/dRVx3W9jVw1oTuIJOKHt
         PE859PnVcsunIuyDOZ8XHtYwSrDdu/toGtG0splqrxS3Q6+amSgt/51F/o3VlOQLG0BL
         hMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+69gBDWXDsmklsuisXB2PTXgsG2vWmN63+2DybJAvcs=;
        b=dNzlbGJto1KK69K91m2HRpx/6X3njl4EKqWK537XbSUGtv9XyOXL4R5iAL0xOxM4aB
         ICYJSZxICVklRkGrAkaaMpAOoVFZJzhJ5aNTHwef6CHj0ofVQo7MF2ilZkt3JqkGrpYq
         6w5gIju+JgjT0/N73D50VxjNqmtje7Li+zFTPwwY56vovTX80tvC84I0iFD+UFKhO9ZP
         yTwd7wV32qkpdUpeYt7DZYchO57fu38CZDU2B5XEW5yAPEVDw7Q5ptRtebPLmMZzArFF
         6gmN6xhfpzh3Gwg1BeHVtLYUA8tsWMbRCpWk3Eb9obFu29k54exq6/xM6RLOJU7048vx
         wkAg==
X-Gm-Message-State: AOAM532GX54ZmG4xMFuOI8vGlJ9OKN1J7RdYLw27Cy1juM9/GmVF1Hje
	mYDMOkbxPuU6XNztm7QkHM0KpJVUOE2HycvopA==
X-Google-Smtp-Source: ABdhPJxoQzqjgP9cSw5ArliCNKBKBaas/iDtSXxzUciZ0I+USXYc8ZAd1w1EguVgBL1jHFoqFDBdFolDME4xblf8HyA=
X-Received: by 2002:a05:651c:1213:: with SMTP id i19mr23663462lja.116.1643913727207;
 Thu, 03 Feb 2022 10:42:07 -0800 (PST)
MIME-Version: 1.0
References: <CAEJqkgiV1_jXhoxoxVG4EwV7t=cA=j1F+T-LCEuajJN8x25mtQ@mail.gmail.com>
In-Reply-To: <CAEJqkgiV1_jXhoxoxVG4EwV7t=cA=j1F+T-LCEuajJN8x25mtQ@mail.gmail.com>
From: Gabriel C <nix.or.die@googlemail.com>
Date: Thu, 3 Feb 2022 19:41:41 +0100
Message-ID: <CAEJqkgg_YdwNiCMDED4289fMad9NPgScius2=nNrJEH4aaxVjA@mail.gmail.com>
Subject: Re: AX200 cards broken after firmware cc-a0-67
To: linux-wireless@vger.kernel.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Luca Coelho <luciano.coelho@intel.com>, 
	Josh Boyer <jwboyer@kernel.org>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

Added Josh to CC and corrected linux-firmware mailing list.

Am Do., 3. Feb. 2022 um 18:58 Uhr schrieb Gabriel C <nix.or.die@googlemail.com>:
>
> Hello,
>
> I own 3 boxes with AX200 cards, one is a Killer AX1650x, the other two
> AX200 [8086:2723] (rev 1a).
>
> After commit 4474519a1fd4e7167afae7c5ca2c1b93e17b4d8a in
> linux-firmware tree, which updates
> the firmware to cc-a0-67.ucode, all cards are crashing with microcode
> errors. Firmware  cc-a0-66.ucode
> is still fine. The kernel doesn't seem to matter, as soon I update the
> firmware to >=67 ( I tested 68 too ),
> everything crashes in an endless loop.
>
> I'll attach a dmesg, from 5.17.0-rc2, the same crash happens with 5.16* etc.
>
> Please CC me.
>
>
> Best regards,
>
> Gabriel
