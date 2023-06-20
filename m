Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E50EB64D7
	for <linux-firmware@archiver.kernel.org>; Tue, 20 Jun 2023 15:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7951DC433CA; Tue, 20 Jun 2023 15:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DF4C433C8
	for <linux-firmware@kernel.org>; Tue, 20 Jun 2023 15:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687276101;
	bh=Vkn/oN/Zhkybxbd92sXgUNquk+M52foGAcUEYLu0HpM=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:Cc:From;
	b=O7gWJLJmrTThQK4VTfxqGFWV/tsDHCXYOmZYpbSfpVbfKS8vYCjp2NjyPKIuNDSQz
	 Gx/XOje+M1Ds8gSTm4p+MfYE7FIskQVJfX4NtIip35DA2If6w1GgIey9wLv6gPafZS
	 k9aI2IIUEPlXisNaBIMamg+BvLun9zceTx5JN3nMi+imJkbCT5JnA+DxrSzV+PXO8G
	 DGKjfkl4Oc83750qJrKLFh+JOpeEyGYT9ncFdLDErxlMbX26komQCyQVvr9BchobsB
	 qBQ7N1DTPbaE+86rhLyTT1eAY2nuz3DeBRgVHTEue457cVFrdYno/K3GU9X9ZqeVt5
	 6TLKcyZw10lSg==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-bf3934ee767so3323264276.0
        for <linux-firmware@kernel.org>; Tue, 20 Jun 2023 08:48:21 -0700 (PDT)
X-Gm-Message-State: AC+VfDywfRttDa2FcJWONzLsWfc0AeXdXCYWNMKndvWNCQe9JQb3b6ZD
	fsp7f5WbXlDr1fTaZS004Fh5QkkLFatWqqQbXYE=
X-Google-Smtp-Source: ACHHUZ6cs8OPZPXecZQIgFm3qmzva8t4LtfjOWm1osISEeRcWBPCujvXumSAS/Ithsl6zWZZMEzqgqehgtK5us88j0U=
X-Received: by 2002:a25:bc90:0:b0:bc9:22d:1914 with SMTP id
 e16-20020a25bc90000000b00bc9022d1914mr10661720ybk.10.1687276100364; Tue, 20
 Jun 2023 08:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <aa70a5d6-8ed4-9212-f5a2-cae2a6f9eae9@tmb.nu>
In-Reply-To: <aa70a5d6-8ed4-9212-f5a2-cae2a6f9eae9@tmb.nu>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 20 Jun 2023 11:48:09 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4QL8+_vkkRjo=XN+VuU1dQ8kfk9h2KyvqpqY8JbAagmQ@mail.gmail.com>
Message-ID: <CA+5PVA4QL8+_vkkRjo=XN+VuU1dQ8kfk9h2KyvqpqY8JbAagmQ@mail.gmail.com>
Subject: Re: linux-firmware: fix broken cirrus firmware symlinks
List-Id: <linux-firmware.lore.kernel.org>
To: Thomas Backlund <tmb@tmb.nu>, Linux Firmware <linux-firmware@kernel.org>
Cc: sbinding@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 12:39=E2=80=AFPM Thomas Backlund <tmb@tmb.nu> wrote=
:
>
> Hi,
>
> Commit: 244d6b5c2fdd ("cirrus: Add firmware for new Asus ROG Laptops") ad=
ded
> several Link: entries for cirrus firmwares, but as link and target exists=
 in
> the same directory, the extra "cirrus/" path gets them created as broken
> symlinks.
>
> Fix it up by removing the extra "cirrus/" path.

Thank you for the fix.  This is now pushed to the main repository.

josh
