Return-Path: <SRS0=RJup=SB=gmail.com=youling257@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D7EC433EF
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Jan 2022 15:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD9F0C36AE7; Mon, 17 Jan 2022 15:27:19 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A11FC36AE3;
	Mon, 17 Jan 2022 15:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A11FC36AE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id i8-20020a17090a138800b001b3936fb375so30461812pja.1;
        Mon, 17 Jan 2022 07:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AQHbp05GRBTSpeg1nawQrUMrhMjAwJwv9Vnx4a0x5Yo=;
        b=CTDICGN5XjgNXPV2YEX94rsuaI2TH4OY8acUW/CFdEHCBhFus2IzyQygMsysXITVwn
         ZTdCIs02YQxBLLfplNXh3SM4XIRPT5ZHOWm+RBsmpOmFwTPgS4GHj82VRKNd/kw8bGSo
         9ENzgV1hPNMFyTvXjoz3QCRc4myEER8iw2vyuppEaxCEsRJWCwTNqqddriN/5qGyES2O
         HX5zyOvB2l6mQzJk45jCIAsayBnKP9N1TQD36mopUrHBdysJTwcka/mDTirFBoCoi/wY
         N3CtP+U40EgXiVa24jVWbNNz3HiXGsOEgPqCyu6slSADFRpZVhI+HQIX3dBTQqZ/ChDH
         AZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AQHbp05GRBTSpeg1nawQrUMrhMjAwJwv9Vnx4a0x5Yo=;
        b=W8ce9+P9QIma7qYc56hk/NYq9NtiyrbPMNIPfrArMJE6pjWj8Ishy+ZX6wXAt/AoG7
         9QVntRJDi5zTpovYN82y5ny1gG4CXGcPwt3jPZxKr/JRhOpwpuZRsyrBQVFgQwBUaQPA
         d8iPdySK0h/OugjCFWtcA/IsurgIhhMNagsJZK63yKHGuNIpWqyXD+1Cq7c29S+GtDF+
         EVLQpjIGOUVMlyaFcOWS/AQ9ZVeuAbU1072xmAqrtbuwPvaJfw9cZt+RydMNfvdT/TLi
         K//icogvg083/YUVEpEub9qbf+SL/wNGqG+DF4LeasKt0+K+PuaI3suy19A5pFVdt+jU
         8RLQ==
X-Gm-Message-State: AOAM531Tx/KhWooAQdlESOuoWYlOmq9k8caw+ezBVhfB1NXW4tnFTnNX
	5FwHV7i/a3Usonx5H0Mkn/CfdfgdIFkSBmEhGy0=
X-Google-Smtp-Source: ABdhPJx+Ym9nWG0TdjMfEzDsSlDd+DcKcg4/tWXQIuD9xHOZYKV9i9vS1/Ys36hUchPIdwZFxGeDTA==
X-Received: by 2002:a17:902:9001:b0:14a:a1b2:1e6d with SMTP id a1-20020a170902900100b0014aa1b21e6dmr10621980plp.124.1642433238607;
        Mon, 17 Jan 2022 07:27:18 -0800 (PST)
Received: from localhost.localdomain (ip138.ip-54-38-217.eu. [54.38.217.138])
        by smtp.gmail.com with ESMTPSA id p11sm12495226pgh.23.2022.01.17.07.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 07:27:18 -0800 (PST)
From: youling257 <youling257@gmail.com>
To: luca@coelho.fi
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
	linux-wireless@vger.kernel.org,
	kyle@infradead.org,
	jwboyer@kernel.org,
	ben@decadent.org.uk,
	golan.ben.ami@intel.com,
	vicamo.yang@canonical.com
Subject: Re: pull request: iwlwifi firmware updates 2021-11-01
Date: Mon, 17 Jan 2022 23:26:55 +0800
Message-Id: <20220117152655.3130-1-youling257@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <19391a6dd10076e3a64aff20d68a9a37ac56e794.camel@coelho.fi>
References: <19391a6dd10076e3a64aff20d68a9a37ac56e794.camel@coelho.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cc-a0-67.ucode cause a problem on intel ax200.

[ 4020.801115] Intel(R) Wireless WiFi driver for Linux
[ 4020.807324] iwlwifi 0000:07:00.0: api flags index 2 larger than supported by driver
[ 4020.807359] iwlwifi 0000:07:00.0: TLV_FW_FSEQ_VERSION: FSEQ Version: 89.3.35.37
[ 4020.808137] iwlwifi 0000:07:00.0: loaded firmware version 67.8f59b80b.0 cc-a0-67.ucode op_mode iwlmvm
[ 4021.364162] iwlwifi 0000:07:00.0: WRT: Collecting data: ini trigger 4 fired (delay=0ms).
[ 4021.364169] ieee80211 phy2: Hardware restart was requested
[ 4021.364209] iwlwifi 0000:07:00.0: FW error in SYNC CMD SCAN_CFG_CMD
[ 4021.364215] CPU: 0 PID: 22203 Comm: kworker/u16:0 Tainted: G        W         5.16.0-android-x86_64+ #1
[ 4021.364221] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./B450 Gaming-ITX/ac, BIOS P4.10 07/08/2020
[ 4021.364224] Workqueue: phy2 ieee80211_iface_work [mac80211]
[ 4021.364293] Call Trace:
[ 4021.364297]  <TASK>
[ 4021.364300]  dump_stack_lvl+0x34/0x44
[ 4021.364309]  iwl_trans_txq_send_hcmd+0x379/0x390 [iwlwifi]
[ 4021.364338]  ? wait_woken+0x70/0x70
[ 4021.364346]  iwl_trans_send_cmd+0x5a/0xe0 [iwlwifi]
[ 4021.364371]  iwl_mvm_send_cmd+0x12/0x40 [iwlmvm]
[ 4021.364392]  iwl_mvm_config_scan+0x104/0x170 [iwlmvm]
[ 4021.364416]  iwl_mvm_bss_info_changed+0x69d/0x7a0 [iwlmvm]
[ 4021.364433]  drv_bss_info_changed+0x8f/0x1a0 [mac80211]
[ 4021.364490]  ieee80211_sta_rx_queued_mgmt.cold+0x10c5/0x1382 [mac80211]
[ 4021.364572]  ieee80211_iface_work+0x2f7/0x400 [mac80211]
[ 4021.364648]  ? __schedule+0x2f7/0x920
[ 4021.364654]  process_one_work+0x1c6/0x3d0
[ 4021.364661]  worker_thread+0x4d/0x3d0
[ 4021.364666]  ? rescuer_thread+0x390/0x390
[ 4021.364672]  kthread+0x15c/0x180
[ 4021.364676]  ? set_kthread_struct+0x40/0x40
[ 4021.364681]  ret_from_fork+0x22/0x30
[ 4021.364688]  </TASK>
[ 4021.364701] iwlwifi 0000:07:00.0: failed to update power mode
[ 4021.364710] iwlwifi 0000:07:00.0: PHY ctxt cmd error. ret=-5
[ 4021.364719] wlan0: associated

cc-a0-63.ucode and cc-a0-66.ucode no this problem.
