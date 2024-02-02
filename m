Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A008AC47DB3
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Feb 2024 12:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86222C43390; Fri,  2 Feb 2024 12:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709A5C433C7
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 12:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706877125;
	bh=Rh45r8jufME2qVIbP0ySwODK12+w332MwPZFt/o/WEQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=elHwT/Fc2ojh/e1YjhIvq4dv34L6M/kH9pMB9I/kKDZZYZgcPjjmjlyIJpWtdP2yC
	 XLmF4B507nqZUD6KEjwznMPCSXtBEE7HEtuLaigcyP7tY/j+wwWDpRDNDwoj+79nc8
	 I3qvXCRxOPpD+28u66WmiURx4PGWxTXjSDukzCvRd+0Voi6YSMY0DzyCru9zjXysGU
	 Frq0L6E6Od3rAYONFn0O2rH/q5nedJNddeV3lkgS4iMfUupKgvceZMLSHXnQ5Ak1RB
	 BaH8l6KmwBf6jyIKiV4fcBCKLL7HgO8vlx1nJ1OYczw82CobwGNozkDlWxuJa/yBy6
	 bJUOdGNjmwrig==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60407e7a6caso22108057b3.1
        for <linux-firmware@kernel.org>; Fri, 02 Feb 2024 04:32:05 -0800 (PST)
X-Gm-Message-State: AOJu0YwfFza8N5aoT20kYq8eEUzySRD+CWpH3LaHRa6dYFz9n0Cnx0tS
	3v/jrAZFdhe2pDlV5L2pRERcwFumRLZjihBtDzdX+hkc4rWHp4zimnxw+JsJ5r4SY8DK2uHpAZR
	bYWRu3LM90guELg/y/nkth9Zatsk=
X-Google-Smtp-Source: AGHT+IHqONvJLIdYsA4a99XEd2k90V65ACXzyU5D3qqwriZWSmQ1IVJmu+2Y9HrmxtlYXp55vTDjsld8QUSOWlcA++Y=
X-Received: by 2002:a25:86ca:0:b0:dc6:cb1a:cc49 with SMTP id
 y10-20020a2586ca000000b00dc6cb1acc49mr6452326ybm.63.1706877124643; Fri, 02
 Feb 2024 04:32:04 -0800 (PST)
MIME-Version: 1.0
References: <20240129051225.184093-1-chiahsuan.chung@amd.com>
In-Reply-To: <20240129051225.184093-1-chiahsuan.chung@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Feb 2024 07:31:53 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4Z0xKYQ0ezYKFOrZeSxv9YMvCo6MMybjieT9Lzzau=Tw@mail.gmail.com>
Message-ID: <CA+5PVA4Z0xKYQ0ezYKFOrZeSxv9YMvCo6MMybjieT9Lzzau=Tw@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.202.0
To: Tom Chung <chiahsuan.chung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This email is empty.

josh

On Mon, Jan 29, 2024 at 12:12=E2=80=AFAM Tom Chung <chiahsuan.chung@amd.com=
> wrote:
