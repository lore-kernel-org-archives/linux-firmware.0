Return-Path: <SRS0=xqtY=2F=gmail.com=rtl8821cerfe2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44C3C433F5
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Oct 2022 17:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6DA80C433D7; Tue,  4 Oct 2022 17:44:03 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5EC18C433D6
	for <linux-firmware@kernel.org>; Tue,  4 Oct 2022 17:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5EC18C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id y8so19824880edc.10
        for <linux-firmware@kernel.org>; Tue, 04 Oct 2022 10:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=YHbXtNhISHkREv1vTJ2pQhQtmPQw2P9ia6F1AC4g60w=;
        b=WUxA4zM1djuJxjjEDz8NR61kpVMwap79KTck9K2eGY7wZCTSbbzATBEs+D1mynmOzJ
         sip1iItLvK9BysCrw9ctfSI7jIserMGDq6eaZduDPQU5KzpYKSoEP2WoI43+4EhdQfWW
         9Rs4I0GjkTlyNyBCZnlWhGer/qkPiabgnHoQmrp1XhNvWw6G+tEUVSkYn4tyCb2udy4i
         944smnoMf8pXSLfwce66CXZFI469DdR6FTcY6B9wsROPkE/dfag3wpikrp0GRGI1QjX9
         t3jhZ27StoIQBjtQx06HRxsrGDK0I7j0O0yAZg/uD3UjTm+td+/F8y4YS6o1vGYw6zwu
         a3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=YHbXtNhISHkREv1vTJ2pQhQtmPQw2P9ia6F1AC4g60w=;
        b=ae0RXRSlMgur9IjD3bOl4tp0KVhy7mWRN186QSiSLwoRtJGNUxKKmvV0LmVH1PnrJp
         mn4DxyisJjr1Luh9aCFF8IDQ4MkiefaPpUYKU1jCSajzbCcBKZCL/slzTwU4+wcOxEDN
         +vmSmamQeYb6GWhnIuA4woN0sE2m9FD3l5SU43BjOysYZeLkgGGc7qbEXVu+9Qt+N7Db
         dPWZCxmdWYWQoy31XQ3Zl102fwo6i8g/gKWsaoTQaPXtf0urcwSpvby/zhzDeY56aVFn
         STuLgE9zNoS0DtUA5bg2GmmGUEhouFWEgzsnllc+/lpxNJF1G4wRmpYV2W9oSVPMh8Dv
         Rsrg==
X-Gm-Message-State: ACrzQf1SlSOxhYk1iNzjPHSqj5C0uCYrvVt2twe5U6b8S1yOSlPn1x4p
	JT8RRM2YAYlmxc13QMU0AhStqyZK+iE=
X-Google-Smtp-Source: AMsMyM4ndFJGwud8zhlEgJem9xIZYLxKQXdqB9U3721t6uhtlQQ4TtoXxkhHdblOlrD1NMZdkonO/g==
X-Received: by 2002:a05:6402:3988:b0:44e:6f08:ddfb with SMTP id fk8-20020a056402398800b0044e6f08ddfbmr23960710edb.89.1664905439418;
        Tue, 04 Oct 2022 10:43:59 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.23])
        by smtp.gmail.com with ESMTPSA id jg36-20020a170907972400b00773c60c2129sm7347020ejc.141.2022.10.04.10.43.58
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 10:43:59 -0700 (PDT)
Message-ID: <3cf9ecd2-b579-56a3-ddf6-de31f2c96886@gmail.com>
Date: Tue, 4 Oct 2022 20:43:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: [PATCH] rtlwifi: Add firmware v15.0 for RTL8188FU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

rtl8xxxu supports this device now.

The firmware was extracted from the Realtek vendor driver
rtl8188FU_linux_v5.11.5-1-g12f7cde4b.20201102 found on the CD shipped
with a USB dongle, from the array array_mp_8188f_fw_nic in the file
hal/rtl8188f/hal8188f_fw.c.

Signed-off-by: Bitterblue Smith <rtl8821cerfe2@gmail.com>
---
 WHENCE                  |   6 ++++++
 rtlwifi/rtl8188fufw.bin | Bin 0 -> 20832 bytes
 2 files changed, 6 insertions(+)
 create mode 100644 rtlwifi/rtl8188fufw.bin

diff --git a/WHENCE b/WHENCE
index d67b12d..c2daed5 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3228,6 +3228,12 @@ File: rtlwifi/rtl8192eu_nic.bin
 File: rtlwifi/rtl8192eu_wowlan.bin
 File: rtlwifi/rtl8192eu_ap_wowlan.bin
 
+Info: rtl8188fu taken from Realtek driver
+      rtl8188FU_linux_v5.11.5-1-g12f7cde4b.20201102
+      Firmware is embedded in the driver as data statements. This info
+      has been extracted into a binary file.
+File: rtlwifi/rtl8188fufw.bin
+
 Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
diff --git a/rtlwifi/rtl8188fufw.bin b/rtlwifi/rtl8188fufw.bin
new file mode 100644
index 0000000000000000000000000000000000000000..53016c035c960e20c2d300dc4ef72cff40a68733
GIT binary patch
literal 20832
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
F{{;cPS$zNi

literal 0
HcmV?d00001

-- 
2.37.2
