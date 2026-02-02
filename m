Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A9AE7315B
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Feb 2026 12:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D545C19421; Mon,  2 Feb 2026 12:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43298C2BC86
	for <linux-firmware@kernel.org>; Mon,  2 Feb 2026 12:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770034652;
	bh=qBipM3Hq19/UWs+y4mRcESFL52/vnWkHlZ3VsNhCEcA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=SgYni76ACD8uVnMFn2VJMvokuAkPPZvWAeTbnGT5Z4OE0HqNHwxwvETyTybC5RdSo
	 qoDE3HgqtoBmaWSAVrsk36jmvjXyuNg4PUBh8VQwvNbZG1JFTUc4qmjsp16BMWu54v
	 1QiWQ01laVAa1501CxRwFo5Sl90m81CkK+GyMs9mm9kss/vwSo0orn8lETWX+3qE9h
	 HNJ0o3JK1/uPbVqGaLvSpf76/gN/lPAwQbuQMOPyEZWnD60V9TVhJzd9ug1laKBNGD
	 kDQz8uhtDfVejzKbsiwEfJ+Rwt2HDByv1AekHXxTgxYvr36BIMZn4DzyolNwZHMOHT
	 7NHsbzTPpddKQ==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79496f0ea57so38087187b3.0
        for <linux-firmware@kernel.org>; Mon, 02 Feb 2026 04:17:32 -0800 (PST)
X-Gm-Message-State: AOJu0YzH3mCtNqp6bQxFszhWsx4RyoGZbSxJNljKD9eaPfk/p7EoEjc8
	rT/kgdAnG5gekRGu4MobVY5HBhJHVCyOaX67BrjxS/GNv9sMjSpvZsjKx+mL2ubqcxcwrO255nE
	6KP3az8ntJXweBxVBpgsgTBgNvoqKh18=
X-Received: by 2002:a05:690c:c507:b0:794:cf93:556 with SMTP id
 00721157ae682-794cf930ab0mr27118567b3.30.1770034651457; Mon, 02 Feb 2026
 04:17:31 -0800 (PST)
MIME-Version: 1.0
References: <20260129171430.21343-1-anthony.l.nguyen@intel.com>
In-Reply-To: <20260129171430.21343-1-anthony.l.nguyen@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 Feb 2026 07:17:19 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6h0z2zq=DFO-t3pC721uzntevMJZVxf+NegMKVoQAOow@mail.gmail.com>
X-Gm-Features: AZwV_QgeF8g4UliW9rAQMJfuPPoEEIY2aCdjZQMBRqvgMpeQ5lxk0Y0luTJVoXM
Message-ID: <CA+5PVA6h0z2zq=DFO-t3pC721uzntevMJZVxf+NegMKVoQAOow@mail.gmail.com>
Subject: Re: [linux-firmware][pull request] Intel Wired LAN Firmware Updates 2026-01-29
To: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, marcin.szycik@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/894

josh

On Thu, Jan 29, 2026 at 12:14=E2=80=AFPM Tony Nguyen <anthony.l.nguyen@inte=
l.com> wrote:
>
> Update the ice DDP LAG package to include support for E830 devices.
>
> This uses a dual-segment package with one segment for E810 and one for
> E830, which increases package size.
>
> The following changes since commit 2e5a8b0550ba3255bccc2bac57c520259968f5=
e9:
>
>   Merge branch 'main' into 'main' (2026-01-28 02:12:22 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/firmware.git dev-qu=
eue
>
> for you to fetch changes up to 524647ff511fd1c5ed5086e8bbf16acb96df2ce9:
>
>   ice: update DDP LAG package to 1.3.2.0 (2026-01-29 08:37:49 -0800)
>
> ----------------------------------------------------------------
> Marcin Szycik (1):
>   ice: update DDP LAG package to 1.3.2.0
>
>  WHENCE                                |   2 +-
>  intel/ice/ddp-lag/ice_lag-1.3.1.0.pkg | Bin 692776 -> 0 bytes
>  intel/ice/ddp-lag/ice_lag-1.3.2.0.pkg | Bin 0 -> 1360772 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  delete mode 100644 intel/ice/ddp-lag/ice_lag-1.3.1.0.pkg
>  create mode 100644 intel/ice/ddp-lag/ice_lag-1.3.2.0.pkg
>
> --
> 2.47.1
>
