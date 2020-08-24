Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9336C433E1
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Aug 2020 20:15:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D37D52074D; Mon, 24 Aug 2020 20:15:22 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AF8C3206BE
	for <linux-firmware@kernel.org>; Mon, 24 Aug 2020 20:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598300122;
	bh=4jeriDJw2YUeCS9h8he611vh/P3Q6Y7hUlD6GfHndDE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HTynghr7ar8RLZne5gYY/JccesIlSeuZR66dnz/a5c24j/zEFSa0eUjIieZSS7MGI
	 N0kQyCH2D/5DGyX1+EOibS5LBALoLps6OlBliXhDG95dZmrWpWw8nJgqAkrce4yCqJ
	 hOsEWa97nW+Mopy+DIBGXCcqqgNQZ+wzcjLf6v5Y=
Received: by mail-io1-f49.google.com with SMTP id u126so10049230iod.12
        for <linux-firmware@kernel.org>; Mon, 24 Aug 2020 13:15:22 -0700 (PDT)
X-Gm-Message-State: AOAM532yoCjYXJ9FvZNF9p2b8Vug7b7a5ZkOQeyphXyFnI52SimsS0QP
	l13+R0pcdAdBVF/gHqgyi2CxzKBprJzfU1g9K/A=
X-Google-Smtp-Source: ABdhPJwo9UTnTxpUmHuEd7ihJ8AYFaK6er7uVS1zBGk5BdNCFe8K1diBE8JEWRw2O5T4KdzgqmIdtRybpVU0MBHGCnE=
X-Received: by 2002:a02:2a81:: with SMTP id w123mr7116884jaw.107.1598300122133;
 Mon, 24 Aug 2020 13:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_McWVA0fPPsjPO8YddUPyKuTv7pBRuu1hKpD7OH-eYq9w@mail.gmail.com>
In-Reply-To: <CADnq5_McWVA0fPPsjPO8YddUPyKuTv7pBRuu1hKpD7OH-eYq9w@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Aug 2020 16:15:11 -0400
X-Gmail-Original-Message-ID: <CA+5PVA56+dzGhOSrDYpZpe75JEmN=AAQhtd-QJhndzOa4r+H3A@mail.gmail.com>
Message-ID: <CA+5PVA56+dzGhOSrDYpZpe75JEmN=AAQhtd-QJhndzOa4r+H3A@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 19, 2020 at 10:58 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Firmware updates for amdgpu.  This adds updated firmware for navi10
> and adds the firmware for a new GPU, navi12.  Please apply.

Applied and pushed out.

josh
