Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_40,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137EBC433F5
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Sep 2021 16:45:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E8C4A6103C; Thu, 23 Sep 2021 16:45:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D28A860F43
	for <linux-firmware@kernel.org>; Thu, 23 Sep 2021 16:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632415528;
	bh=NxlI+Sw++blUNVqbLjCs9/pwUfH11Gws30fcaBB2Rlg=;
	h=From:Date:Subject:List-Id:To:From;
	b=ICofRDIhL315L04o7VQJuZTQvNe0WAmCCQuoQ9O9h1SqPEXNRwpnYhQSnAPt7+1HK
	 95gL8OOoSS7o9I+8LLE12oCEylfC3YTFHWxUmdEWALUhclhizwl8wTIAfg8o29HVMo
	 K1GpDxCMLj+m80hdSPoDBAK3HXOJJ1j84dW2wPUvJRTEb6C+v674CfzG5Y6u8Dpowg
	 WaCput8cqP8+vvPRJyTKZJIC9hSgsYp+sY/zkGCKaleVkyFbT173NMoLewLHhM+7dL
	 DiH3CZudOU/mW4PwAIGFxUu5/P8VLEqtF59dyjjcRqsI6M2CVgSVbhxycC/OEzURy5
	 MIqf9si1FsmGg==
Received: by mail-io1-f42.google.com with SMTP id s20so8932104ioa.4
        for <linux-firmware@kernel.org>; Thu, 23 Sep 2021 09:45:28 -0700 (PDT)
X-Gm-Message-State: AOAM530NHnHhsfx5KnRX494pXuP4BB2Zwa5MP8dCG3bufnfcuNd8V6MB
	OLwsqt3KA1qTLerb8WE0YhmCU1EVb8VdNV1rShE=
X-Google-Smtp-Source: ABdhPJzM2/10dMj0QyvZ0EHeaBf1ZogjIFjbG7btR2LIKoelK+eA3tvut5Ks+iibJS1u280gdGCyucBKHCCIJJ5Tow4=
X-Received: by 2002:a6b:6a14:: with SMTP id x20mr4554756iog.177.1632415528290;
 Thu, 23 Sep 2021 09:45:28 -0700 (PDT)
MIME-Version: 1.0
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 23 Sep 2021 12:45:17 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6u7VfQiMsr25bZxNP=M9oKr1FS513=tgOZ3dj2QniZzw@mail.gmail.com>
Message-ID: <CA+5PVA6u7VfQiMsr25bZxNP=M9oKr1FS513=tgOZ3dj2QniZzw@mail.gmail.com>
Subject: linux-firmware master branch removal
List-Id: <linux-firmware.lore.kernel.org>
To: Linux Firmware <linux-firmware@kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi All,

For some time the upstream linux-firmware repository has had both a
'main' and 'master' branch that have the same content.  Commits have
gone to the 'main' branch since it was created, but 'master' was
retained to allow existing clones to continue to function.

On Jan 10, 2022 I'll be deleting the master branch.  Please update
your clones to use 'main' in the meantime.

Thanks!

josh
