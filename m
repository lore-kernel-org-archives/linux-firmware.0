Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE82FA3741
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Oct 2022 15:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50F31C433D6; Mon, 31 Oct 2022 15:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E87C433D7
	for <linux-firmware@kernel.org>; Mon, 31 Oct 2022 15:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667229213;
	bh=E/kVWOpAq/NCMKh5yttlpcCpohUjAQqgxMopeG0WQrk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=t2z1GqP9h6vScuJ8ElV5ugjO/167eI6X9bqo7TEBrxJET8nKZSpBZ/Mq3bDO9Rogv
	 wUWgwAabpnAuchKR3xaY9B8GiG/SVPW0d/SnpSQoXPsApdSn5hx8pNTcsXQxDaK2Y0
	 IeX6Gu1Xs2Axr+KVTlcijqgB/zR47QT+vgsAvToTOdJIRqJkQPzSWLEQGGzOIvuES/
	 EZGLqp7lkE/4DsgmbSYhc182GXMHEKF+gQmQvIy2tXm7kdHa8qQcsFZHi0H3fWRhb1
	 6A/Ts9dwdqSGnUEw1E8/dlN3mQPs6O4FwUDgM0kaSuvfEe+Wy3dg7hACyWmMLtSbEI
	 HQ7GHUN/kvsrA==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-13b23e29e36so13760651fac.8
        for <linux-firmware@kernel.org>; Mon, 31 Oct 2022 08:13:33 -0700 (PDT)
X-Gm-Message-State: ACrzQf1JqfOc4cpgTtx7I/IGr3Yq0/9967GBbLuJV0lkUWe43kKPLt7+
	VpYrXjwZYP3RpLAv+Clyh9jILJ8FChVkzfKW0jg=
X-Google-Smtp-Source: AMsMyM6/M8wg7CS2dp4KINB9ViLVWtCc7R4/Z4/kwe0fi3tY3PchwOxMSciDMoDy1QyH/vhKnKdLj0e0jF5EpLJc+ow=
X-Received: by 2002:a05:6871:723:b0:13b:f919:3146 with SMTP id
 f35-20020a056871072300b0013bf9193146mr7843165oap.267.1667229212368; Mon, 31
 Oct 2022 08:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <002201d8eabe$cc45c540$64d14fc0$@opensource.cirrus.com>
In-Reply-To: <002201d8eabe$cc45c540$64d14fc0$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 31 Oct 2022 11:13:21 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6Tx94a4Qd0s7aEUYmx8qtUp7B9=_3JtNCTqXAw-UNFKg@mail.gmail.com>
Message-ID: <CA+5PVA6Tx94a4Qd0s7aEUYmx8qtUp7B9=_3JtNCTqXAw-UNFKg@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus CS35L41 on new
 ASUS Laptop
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 28, 2022 at 7:17 AM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> Hi,
>
>
>
> We would like to add firmware files to support Cirrus Logic Smart Amp CS35L41 for an additional ASUS Laptop.
>
>
>
> Thanks,
>
> Stefan Binding
>
>
>
> The following changes since commit 0cac82d36af9f9b1d3e532dccf0c690408ccb454:
>
>
>
>   Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-firmware (2022-10-24 12:07:56 -0400)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware for-upstream
>
>
>
> for you to fetch changes up to abc0302fa0b22594150ac95ee72fa1a4da35a71c:
>
>
>
>   linux-firmware: Add firmware for Cirrus CS35L41 on new ASUS Laptop (2022-10-28 12:11:24 +0100)
>
>
>
> ----------------------------------------------------------------
>
> Stefan Binding (1):
>
>       linux-firmware: Add firmware for Cirrus CS35L41 on new ASUS Laptop

Pulled and pushed out.

josh

>
>
>
> WHENCE                                              |  10 ++++++++++
>
> cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid0-l0.bin | Bin 0 -> 1956 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid0-r0.bin | Bin 0 -> 1932 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid1-l0.bin | Bin 0 -> 1940 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid1-r0.bin | Bin 0 -> 1916 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431f12-spkid0-l0.bin | Bin 0 -> 4932 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431f12-spkid0-r0.bin | Bin 0 -> 4908 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431f12-spkid1-l0.bin | Bin 0 -> 4916 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431f12-spkid1-r0.bin | Bin 0 -> 4892 bytes
>
> 9 files changed, 10 insertions(+)
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid0-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid0-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid1-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-cali-10431f12-spkid1-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431f12-spkid0-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431f12-spkid0-r0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431f12-spkid1-l0.bin
>
> create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431f12-spkid1-r0.bin
