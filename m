Return-Path: <SRS0=wgDl=47=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3081C4708E
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Jan 2023 13:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97933C433F0; Mon,  2 Jan 2023 13:14:48 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BE58C433D2
	for <linux-firmware@kernel.org>; Mon,  2 Jan 2023 13:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1BE58C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id cf42so41518793lfb.1
        for <linux-firmware@kernel.org>; Mon, 02 Jan 2023 05:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2wL0BRy9JmOBANp9cin/eCy+qhM4UVnyF7/MyAOlG+g=;
        b=Uwbeb9Ic9RQjuuyOCQPJ9OCGT//taQ47K8wpecpguvpncKZ97WVk0RChSHyKvx12Ud
         MFk14ro2zmtBRZJRcZcvuGss5QBshZJ/WEDwLXvW7AZrbO3xZQGQYmkXbavj0pPpkp6Y
         5SemAwYnpfn/J48FfK3dT4bATkH3+DSKaXSBb8YNogsOc5kflDZsb8maPzR5lxgyICYF
         3rdarirsbUjfVuk6aOurmUpt8oKSInEjskoqwN2jYDqz1ELBMloi4QFAL37dQ9C+OyS3
         45VSABbEwYkSjY8NUU7Jj8l82BuGOZftkhXu5pmWdosxEtkMD8XB6WbRRldEeOZ7WzoN
         KT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wL0BRy9JmOBANp9cin/eCy+qhM4UVnyF7/MyAOlG+g=;
        b=ZHSFsD5dAgqi+03p18kE1NR9XK/7sSih76i/FNxuJYmMnCrClque1vdgSfW4umGbxV
         YkQ2UGvJCF8a0HxyWJNcRHZ0vmVRma7QmDR8xk0reRkapqV12BIvxXVls8o9ZFk+eivt
         5fjcfGW3Uxs7zpwuaIzwu6T07dHtrZTZh+6YOYxtf8+O60P/fjsdaimWAUSVJUCIVxVI
         VrAiKKuJHD5txybo/wG93URBN/jGumJiozKv7sXiewHpjCWAg948AhDCUSxWmexdZDjH
         5CtIgupo6bgiDzOTQJTG6MjCT+DAjQZPeQpsehsRpCJU+PtS9LEHLnAS6cZfAm8RfNrQ
         /aNA==
X-Gm-Message-State: AFqh2koAeynR7R1kkFpFwgOT8IXrUFhGx3fX/G4v38SVWrVsly+VnEoG
	uTlpERFCztJ1GpxSEIgT8A4WMuS71Hb561ct
X-Google-Smtp-Source: AMrXdXuQViMsExlvQHyUeRJW4fkIvk2H5IGp8uMDwEDInRdLHTR+5knLjDYw+lCU8yqK9bwHxbWMxw==
X-Received: by 2002:a05:6512:3a8f:b0:4c8:5f19:ccb8 with SMTP id q15-20020a0565123a8f00b004c85f19ccb8mr12379921lfu.48.1672665284888;
        Mon, 02 Jan 2023 05:14:44 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s4-20020a056512202400b004b5979f9ba8sm4455657lfs.210.2023.01.02.05.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 05:14:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Rob Clark <robdclark@gmail.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] qcom: add firmware files for Adreno A200
Date: Mon,  2 Jan 2023 15:14:43 +0200
Message-Id: <20230102131443.905304-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add firmware files for Adreno A20x (codenamed yamato), found in
Freescale i.MX51/i.MX53 and in some prehistoric Qualcomm Snapdragon
SoCs.

The firmware were generated from the header files from EfikaMX kernel
sources ([1]), which bear copyright by QUALCOMM Incorporated and have
BSD-3-Clause licence.

[1] https://github.com/genesi/linux-legacy/tree/master/drivers/mxc/amd-gpu

Cc: Rob Clark <robdclark@gmail.com>
Cc: Jonathan Marek <jonathan@marek.ca>
Cc: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Note: the following patch needs to be applied to get this firmware to
work. It is most likely to find its way into the 6.3 kernel.

https://lore.kernel.org/dri-devel/20230101155753.779176-1-dmitry.baryshkov@linaro.org/

---
 LICENSE.qcom_yamato |  25 +++++++++++++++++++++++++
 WHENCE              |  13 +++++++++++++
 qcom/yamato_pfp.fw  | Bin 0 -> 1156 bytes
 qcom/yamato_pm4.fw  | Bin 0 -> 9220 bytes
 4 files changed, 38 insertions(+)
 create mode 100644 LICENSE.qcom_yamato
 create mode 100644 qcom/yamato_pfp.fw
 create mode 100644 qcom/yamato_pm4.fw

diff --git a/LICENSE.qcom_yamato b/LICENSE.qcom_yamato
new file mode 100644
index 000000000000..1fd702bb9264
--- /dev/null
+++ b/LICENSE.qcom_yamato
@@ -0,0 +1,25 @@
+Copyright (c) 2008-2011, QUALCOMM Incorporated. All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions are met:
+    * Redistributions of source code must retain the above copyright
+      notice, this list of conditions and the following disclaimer.
+    * Redistributions in binary form must reproduce the above copyright
+      notice, this list of conditions and the following disclaimer in the
+      documentation and/or other materials provided with the distribution.
+    * Neither the name of QUALCOMM Incorporated nor
+      the names of its contributors may be used to endorse or promote
+      products derived from this software without specific prior written
+      permission.
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
diff --git a/WHENCE b/WHENCE
index f31fa308cc89..f14730a31368 100644
--- a/WHENCE
+++ b/WHENCE
@@ -5742,6 +5742,19 @@ https://developer.qualcomm.com/hardware/dragonboard-410c/tools
 
 --------------------------------------------------------------------------
 
+Driver: adreno - Qualcomm Adreno GPU firmware
+
+File: qcom/yamato_pfp.fw
+File: qcom/yamato_pm4.fw
+
+Licence: Redistributable, BSD-3-Clause licence, See LICENSE.qcom_yamato
+
+Binary files generated from header files in EfikaMX kernel sources. A prefix of
+four zero bytes was prepended to make them work with the DRM MSM driver. See
+https://github.com/genesi/linux-legacy/tree/master/drivers/mxc/amd-gpu
+
+--------------------------------------------------------------------------
+
 Driver: qcom_q6v5_pas - Qualcomm remoteproc firmware
 
 File: qcom/apq8096/adsp.mbn
diff --git a/qcom/yamato_pfp.fw b/qcom/yamato_pfp.fw
new file mode 100644
index 0000000000000000000000000000000000000000..beaa5949d89eef809dd8cd19c186466dcd4de3cf
GIT binary patch
literal 1156
zcmcJO%}Z2a6vlt|-f?Es5hf6lP-k>3gVesJ5?XX?3Ibas^s%WHwFx5V4^X*e3(1z6
znn5mI)+TThQzI9XJ1GW5yP!q=7xujG+$$<=yKv^b=Xu}roadawfWB17$fXG#mY9Az
zfkR+1&yR!!czm;-fsiw~HK@)vJX3TjZsi$dLo&k2hj_spCN~x5dDQtcIcGTypQ)GR
z<dPgyt38B{5dZNw-G1HjbO-f4JSM*&-X!1F%&DgGy+BsotJ%CY+OjXoq*bds)^Gep
zab=W~HF<uVr?b(Qd3}hUsdZLrvkc_dXbI-&m^nqte?|UbgwvOz;%stX=BmGIqvPVJ
zi*FHUIj!?cN&O_hK{C%PaqmfNbRq47;&*4t>S=+Y4xPp0s_$RouE|VKozm4MEXnoU
zO}i6wU&v}F;whTmq|?N99?CPj>y<Ci=+F4$oqDGpllmuApX!3edxD6fA8|lhwlg0o
zsZK@a-Y7HuZj5Ml9JeZc)rbeeo6N3tHeAn5f6^flOzQ4YymPaIM0Xoow9(LFeLREH
z?dvS{s;8e3cPa}s$r~Q0nBLJ@bGLSO+`sGoWOkkH$$5<5UCSx9?9^>m-4@yIIkYOy
z?ZZmaW@pD2Ti?vj^ET;=aihs#C1Hp6VHIIV_F?9|)s#9aEn7H#L|XP+{~0&Cikn;I
znBs!;GaOp{Sg>Jho4khJsn`qt58s-UX`@o-k)nz3<ay6Q{q{0UiOcHr9{oIFkTHg6
sW`r)viq5jkITkt38!qreFKb+7h3kA^l+WDM6mRjB+q~s2+T=g&FFDHfYybcN

literal 0
HcmV?d00001

diff --git a/qcom/yamato_pm4.fw b/qcom/yamato_pm4.fw
new file mode 100644
index 0000000000000000000000000000000000000000..bc63846dd9f2f3789c1716602c7eda46eb798471
GIT binary patch
literal 9220
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

literal 0
HcmV?d00001

-- 
2.39.0

