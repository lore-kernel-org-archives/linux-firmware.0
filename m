Return-Path: <SRS0=hCgi=3Q=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D696CA1013
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Sep 2025 13:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D705C4CEF5; Fri,  5 Sep 2025 13:38:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35ACBC4CEF1
	for <linux-firmware@kernel.org>; Fri,  5 Sep 2025 13:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35ACBC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857CY09032336
	for <linux-firmware@kernel.org>; Fri, 5 Sep 2025 13:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vtfNmXfKGX/oqCHVr6NI9lgNZUkER/hSsMe
	fx1lIMyA=; b=YGGEA6/LzEjyncUsAHdKZ6Hc7e+pfcXMmt3+u5LzN0hRbc+GhT9
	IBvMhAcXb8emMoozJ1DAC1bnGfS5lrEpsXjRAkwuQZ0tMAnBFnScquk9SIn2Qz9J
	OvxDt0E4qJQiOAPRTJ1eriu48rnEOYAJWwYPF+WWyr56jqxY16EWx9ZnJc2whiFj
	vYmHMkqIRdZUvq2cSERrS/Qt+Lp7k/LYg9yF9QbSpkS41ZkQjREv4Z9Z1affKc84
	H3q4vfxVWsRug7wFTwuE5tYhyTEHItse1rdHHz9jMMqc4Bx0z+O3pvvZVcKaiD6K
	Kw+M9/pFPY9+P2iLr81oorQEz44Tc9R882A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpkdy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 05 Sep 2025 13:38:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5f290579aso4201771cf.0
        for <linux-firmware@kernel.org>; Fri, 05 Sep 2025 06:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079535; x=1757684335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtfNmXfKGX/oqCHVr6NI9lgNZUkER/hSsMefx1lIMyA=;
        b=ihiMrsycEsYmUC68hHYyyDNAOcwBiWPVbGvjnwfm2XAQyxk+EsLBKkqwjH//sws0OU
         ZZyEffnpM0k6xj/zboU0kxdRFS0FDG15TDDpNE0P2MxMoIOW5J/rGdkOnbsct+sBLxGp
         9EaNhNnfF22Q4Xq7Zs9/wMUCxoF/GE14KCJvIcT1sOz5gBl/u88IGmHHq+QELe+F83jb
         eEo8e+rMj/HWbJk5L59XcLmYSwxFKE3ctcATrg9SsBvcx8jAE35/iEZbD4nyT6IrhgJv
         btrw8h8X8jJZrmbEhoAN5A1tO6P1vlAmFyshIWxfIeEVHjMMlh3wflFjE7HDr9cfPphy
         aAUA==
X-Gm-Message-State: AOJu0YycdjmQaZg+QHBeOGPZCFPVh2lf8e4bDcTjRpZc7+O+lUDVSAmG
	2Gg4kuS2zWa8yAH5JoNamVKVOwSC0qJ4hvRi0XpKITA8c3UlMxW0sbKS/0kOFJTtA+Ad5bhUK+h
	Udnx9kYgQ5mCxC4uJ3MGkK3M9qeBVfQej5axA6NHbaMqsLCKpFZ+bzPcI+yCNpJVQj+WpAq8=
X-Gm-Gg: ASbGnctArDGhAHgeMQT0GB3OGEvGKNUxrWSA2jkBMThYzYOLi5+e/ueVLtor8Q7CSs9
	Sdq0J08i9Rgf2n8G6dg+lsdoDQVU02+o5vfMhe6t6wKEJOZXu5pFHGX/uZzM4e927bBnjrJA41c
	V9rhsZHujXGLTSTl2Adf9xSzw7bc54zOXvVLwwZbQd46oETPupL0wlPt0/OAkvuBbUD+W+VGbqG
	3aMe+ra4J2K53UCGlsmPqHV1K+vPVGcMuSMVWqbJLK/mwjDF+oSiAl9vhmXXzM9ZQ1rQpKIW5Ne
	/fBrvQOnGAJPvbUgmbCfCSO0ErCN2QirKynSgk1buaNNyb75ZiCx2FIBr1gnIPRR63Mgf45dMVb
	ODyDPPDxqPhk6To8hDxn/UYYAPvD9vWcslsOg6vyQjCS5hME=
X-Received: by 2002:a05:622a:4c86:b0:4b5:cd35:1b56 with SMTP id d75a77b69052e-4b5cd351bb5mr96784561cf.15.1757079534867;
        Fri, 05 Sep 2025 06:38:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm86id8Ilz6yPa0qRAJ61y3orlhW2jkQhStJ8GcYe92L8/BO18mza2c3NMflEdkhTij8ElHQ==
X-Received: by 2002:a05:622a:4c86:b0:4b5:cd35:1b56 with SMTP id d75a77b69052e-4b5cd351bb5mr96784071cf.15.1757079534006;
        Fri, 05 Sep 2025 06:38:54 -0700 (PDT)
Received: from rohan.lan (2001-14bb-c9-5894-29cc-6fce-5e1d-14f5.rev.dnainternet.fi. [2001:14bb:c9:5894:29cc:6fce:5e1d:14f5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad52b4dsm1760618e87.152.2025.09.05.06.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:38:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH] qcom: move Monaco EVK topology from qcs8275 to qcs8300 subdir
Date: Fri,  5 Sep 2025 16:38:51 +0300
Message-ID: <20250905133851.24318-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: voVgO1Dm_EyNlyuOk8RApS_M8az7tQLM
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bae7f0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=xoBt4Lon3cxEQ7XnBE8A:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: voVgO1Dm_EyNlyuOk8RApS_M8az7tQLM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXwyxnRr3Y0BGM
 ADIsZN28nLjh4J5GwHZpdhO3+zwa7FaCR1Z/AdOUiMyNah0awKJ6F3IK8RL/eckuyeoFuh2jX1E
 guD0064xgBw+IoaXV2+dTHlapJPefHjqum+DiTDgANAmBK8Opa3OpqtxwT5ypnRpjT5f7hQeZc4
 jObNAacjGyKtFMOe5eyFUE+9O5JTFASFK4cFkFLTRNzPx4wvt5JHeXfQYz9RuUO4nNPMnh5Cp8k
 PFXVoNrqTr8UR4DFW5qbWLIdb4BS7EM+V+fZLaZqSRfPCKVxCCpkEVQLFtp7PHF9Ab0n2TI3xUp
 ubgYVk8KVvfCW58PUZO7eoSnA3gtMaTF955/bZ/bEVBISmGFaRM7SpqILaW2p8uPxeF6gLixwj1
 WAoNL1KM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

The rest of the firmware for Monaco is using qcs8300 subdir, the
top-level compatibility for the platform also declares qcom,qcs8300.
Be consistent and move audioreach topology file to qcom/qcs8300/ subdir.

Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 WHENCE                                        |   4 ++--
 qcom/{qcs8275 => qcs8300}/MONACO-EVK-tplg.bin | Bin
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename qcom/{qcs8275 => qcs8300}/MONACO-EVK-tplg.bin (100%)

diff --git a/WHENCE b/WHENCE
index d0af98006743..03c2037cedd1 100644
--- a/WHENCE
+++ b/WHENCE
@@ -8459,8 +8459,8 @@ Originates from https://github.com/linux-msm/audioreach-topology.git
 
 --------------------------------------------------------------------------
 
-Driver: qcom-qcs8275 - Qualcomm ASoC topology
-File: qcom/qcs8275/MONACO-EVK-tplg.bin
+Driver: qcom-qcs8300 - Qualcomm ASoC topology
+File: qcom/qcs8300/MONACO-EVK-tplg.bin
 Version: v0.1.0
 
 Licence: Redistributable. See LICENCE.linaro for details
diff --git a/qcom/qcs8275/MONACO-EVK-tplg.bin b/qcom/qcs8300/MONACO-EVK-tplg.bin
similarity index 100%
rename from qcom/qcs8275/MONACO-EVK-tplg.bin
rename to qcom/qcs8300/MONACO-EVK-tplg.bin
-- 
2.50.1

