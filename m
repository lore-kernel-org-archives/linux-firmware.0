Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C01C433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Jun 2022 13:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 057D6C3411D; Tue, 21 Jun 2022 13:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34DDC341C4
	for <linux-firmware@kernel.org>; Tue, 21 Jun 2022 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655817342;
	bh=vPjPDOBUDMwjoV6fp4kLJnb7wNPJxVOGWmPWg8A3u6k=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JhB/RVkZcPmEkeZhO8QoJ3VB1J9/A/MbKF2XK/yfKyu2myU1IXuy9DWrBqHKCF7mA
	 9llD4DpCj8PjmhQ+0qCZ108RKFCYLTd0i9zEgEZsKq4LVLqhIgqGbSXIFJyakuzvyG
	 GBeP85w6c37gsRtbmCSCa0BuVvVzKpPCZACYk0+x4snY20YImXnmQDaoAKHtVBcDBH
	 ZD6HhXgLRbiikBt8e2/I5ai0+BJzevOjBUWDwueEDol8nuTHUl6wpLXhpjQRqH60U+
	 WQM03lV6c21eZmkoPRn2+RQZ2PyvZdwEM+khwLKlmfQcRpdgcycIIGnBFvtIQP8nY5
	 CcOjssklCcgog==
Received: by mail-io1-f51.google.com with SMTP id d123so14150849iof.10
        for <linux-firmware@kernel.org>; Tue, 21 Jun 2022 06:15:42 -0700 (PDT)
X-Gm-Message-State: AJIora9jxhzXkacMe/IkRS6YCiWqhWZOtEMcN225xF/NKW1VcPtBQCay
	57fLGdz/4yut6xrFaxXS/duQpympDffkcaoHpjY=
X-Google-Smtp-Source: AGRyM1sVLPbLIcbCFrKSq0cLPzZy4ew9zrukrs60vkI9w12VYSlVccowop/6iUD1hjCBnHIz/nD8gAJ9OL3sQ8ELDkU=
X-Received: by 2002:a05:6638:389f:b0:331:b463:fbee with SMTP id
 b31-20020a056638389f00b00331b463fbeemr16885464jav.145.1655817342079; Tue, 21
 Jun 2022 06:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <247174fd-8275-20c5-be09-221381b29afe@quicinc.com>
In-Reply-To: <247174fd-8275-20c5-be09-221381b29afe@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 21 Jun 2022 09:15:31 -0400
X-Gmail-Original-Message-ID: <CA+5PVA75tbeEtVOriSkTGpm+F5QvMvH=40E7tvQCSyO_cYCMVg@mail.gmail.com>
Message-ID: <CA+5PVA75tbeEtVOriSkTGpm+F5QvMvH=40E7tvQCSyO_cYCMVg@mail.gmail.com>
Subject: Re: QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00409
To: quic_zijuhu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, michaelfsun@google.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 16, 2022 at 5:53 AM quic_zijuhu <quic_zijuhu@quicinc.com> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.
>
> The following changes since commit
> 7b71b75be8fb0fa7cceeb3dc22f97920a6be28bd:
>
>    Merge tag 'iwlwifi-fw-2022-06-09' of http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware (Fri Jun 10 07:18:35 2022 -0400)
>
> are available in the Git repository at:
>
>    https://github.com/zijun-hu/qca-btfw
>
> for you to fetch changes up to 47def1cbb1f8d81462d442d672bccb4e14db0c48:
> ----------------------------------------------------------------
> Zijun Hu (1):
>         QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00409 (Thu Jun 16 17:16:23 2022 +0800)

Pulled and pushed out.

josh
