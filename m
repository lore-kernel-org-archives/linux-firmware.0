Return-Path: <SRS0=YemY=2M=gmail.com=rtl8821cerfe2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121E0C433FE
	for <linux-firmware@archiver.kernel.org>; Tue, 11 Oct 2022 20:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BED95C433D6; Tue, 11 Oct 2022 20:39:12 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8F63C433C1
	for <linux-firmware@kernel.org>; Tue, 11 Oct 2022 20:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8F63C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id m15so21763873edb.13
        for <linux-firmware@kernel.org>; Tue, 11 Oct 2022 13:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bUyWiWHTfL4nj2Zjd26fKNZLTm9eZzJ2iqhJHxLh9TM=;
        b=l4GcrL1/MCvIpdDGuxkVZhfbuPViY19pzsq4z4fh6vD82JlkLpzG1CdrwZj0fD93Qn
         63k6kGiMdwDgJGnPI3kxsooeFbc4k9Ca41HHkKhT3A/DpuzDvhzruzgpG+5lGTG4+45+
         HGsXnbW+znIwQ7fdCS4+0aw5scB5IcBFgvYEmrmCN4R2Cg9pEXING+owcoiwok4j+AkK
         1gDYc0qF36CKL3fqXlJRIeDcJCELP82fQz8q3ayJL6R61Z8/VFkdB1hd7heKsC70skbG
         3poD25SMnoMVgEgQKTh8YFD0bui6CUmd60u+7xPFpIEWcBoQzF7I1y4OFUcthwFSSLKD
         aOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bUyWiWHTfL4nj2Zjd26fKNZLTm9eZzJ2iqhJHxLh9TM=;
        b=4sPh07QpGkqGWpM689nR3RE72sI1C6ke0ZmYKq5+8vlTPcU/MUHk+8qsGFi9BPnsOr
         spyY/a3i7PDXFu/m0WQhSP1eKe37TWz44JQ8SE7nGNvYZxvwdyXo/FFUvSv23cV7IBc3
         Ez3r03dAqgQDco+QO0rrpWqbKImUOtICrGmEa+i4GOSZTvGqwVhdLDCH8WyAEPOHjg16
         0I3Cx0uxRqkdbQxY/u66xoICweuDLvJwPqgUiL8bz6AL708JmTcn0UCr9M+dy6ctB18c
         +yUPcSq1ZMTyAvJcwfDeUFsULm9fYmTD7CBSNuoi3oj24tNyRqhC26SL1NALfRBxkrMy
         fxyQ==
X-Gm-Message-State: ACrzQf3SdR7J5FfW6o4i2VgGarx/Atd8NwQiLEJrR/xhX9SEBt8JQr9y
	BY7QDBSpbF5oOfwzupsUECZOatmnbm4=
X-Google-Smtp-Source: AMsMyM5EqD9gEuF+5hv5SRSyKr4MeM70R3iPK2DilW59TBsEjgbWaIiYm0m4unRR650zma9DGHQLyw==
X-Received: by 2002:a05:6402:5209:b0:45c:2345:8ca with SMTP id s9-20020a056402520900b0045c234508camr10828696edd.31.1665520750264;
        Tue, 11 Oct 2022 13:39:10 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.23])
        by smtp.gmail.com with ESMTPSA id o5-20020a170906768500b00780ab5a9116sm162081ejm.211.2022.10.11.13.39.09
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 13:39:09 -0700 (PDT)
Message-ID: <316357b5-ef49-86ba-05ff-cc4286d1b8af@gmail.com>
Date: Tue, 11 Oct 2022 23:39:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] rtlwifi: Add firmware v15.0 for RTL8188FU
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
References: <3cf9ecd2-b579-56a3-ddf6-de31f2c96886@gmail.com>
In-Reply-To: <3cf9ecd2-b579-56a3-ddf6-de31f2c96886@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/10/2022 20:43, Bitterblue Smith wrote:
> rtl8xxxu supports this device now.
> 
> The firmware was extracted from the Realtek vendor driver
> rtl8188FU_linux_v5.11.5-1-g12f7cde4b.20201102 found on the CD shipped
> with a USB dongle, from the array array_mp_8188f_fw_nic in the file
> hal/rtl8188f/hal8188f_fw.c.
> 
> Signed-off-by: Bitterblue Smith <rtl8821cerfe2@gmail.com>
> ---
>  WHENCE                  |   6 ++++++
>  rtlwifi/rtl8188fufw.bin | Bin 0 -> 20832 bytes
>  2 files changed, 6 insertions(+)
>  create mode 100644 rtlwifi/rtl8188fufw.bin
Actually, I take it back. v15 has packet loss issues. Sorry I didn't
test it more before emailing. I'll send instead v4 extracted from an
older version of the driver.
