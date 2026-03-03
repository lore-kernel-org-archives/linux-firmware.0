Return-Path: <SRS0=Z4Oz=BD=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DE0EC142F
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Mar 2026 11:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E59D6C19422; Tue,  3 Mar 2026 11:05:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30742C116C6
	for <linux-firmware@kernel.org>; Tue,  3 Mar 2026 11:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30742C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n5S91838277
	for <linux-firmware@kernel.org>; Tue, 3 Mar 2026 11:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RR7qVTXTGJkNpLJOmWLq4G
	Cd/IfHGceElW78yhqSvCw=; b=f++pOp5t1S+jChG+oIa8D392Y+QPOm3c3iUx0D
	hDvUbLx6d5GUNzSwp97jbkOWPymS1BqYu6NBm2xqgsmKA+t81HMas7jOUOw4RTlm
	OnVWtPzRaxAyPKsxm9UYCuI5I1VwNwhgpU3ZkoXA6UsIA/GAjVrNJmUgXt1D7O/t
	Z6zmUDzin+1uK+PUaUZPt1vmI3ZSDl2d4IT/comka76e1Jxp2abtdU/trnYD5a2w
	jk8kcKD+CRpgbr0tssfu4Ait3YOd5c8xcpwG6+K9+J1vQ7IkyM2cjYyaissvhq0N
	jJaIHJftg3eL7BfLfoGrXrtfUFili4+44RzqqjR0iIEypLuw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnngg9xks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 11:05:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso4494332a12.1
        for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 03:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772535929; x=1773140729; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RR7qVTXTGJkNpLJOmWLq4GCd/IfHGceElW78yhqSvCw=;
        b=RcNV269oonmEWdKbzpuMujxxFIz6ciEk2HciOyHLMpHDLpmM5rRa5CMuwujvUfrK6x
         2ezEglrIld4xU9YIZmLYi3iFKJBl0wxLyDV2S5u7qTmT5nevW2m1HPUU4UbzPo5jaJlQ
         DyglKp8DYmzUTntM0ccLTfmNWLzTUODzcHvijUahCxaBLPvE8qjQm81kIbnZ8EAEPFCQ
         dNo9uKKY5n01lXi0ZuibTNfmcHD7K2xcIrZOpn8hUJGa9uwW6d5GGplkIf3MitJmJG5Q
         MTnREK9iBh9lKeYb/khJXekBK33jUdzaQX9VvlyCQpWQ+JlTjrSNMQmaNaalfcUMFy1T
         QKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772535929; x=1773140729;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RR7qVTXTGJkNpLJOmWLq4GCd/IfHGceElW78yhqSvCw=;
        b=v9SSZrYIFl9/yc+6jS8chjiSCcF2p2LsTJKyF7/zrT2tV4vHHx9iMzLHcTIS1t6D+P
         aZHdzn5tME5c2O8xcxFQPt6DmL2FiTc1VPpWst7gRosgScZLK+uUoAvul0oMbpGuxap8
         ZcagzxweILhCoIou3j79S/3Hj3DWaVBcr56A09mD/3zLxQl7y48smOGfhEtruJuQobb4
         ifmd+GQpzVDo9VNStUsqnOAIQIQDmGF/6frxxfBnTYh68DuTf8oqZq6otAdnLyf05HPE
         zM58fPsZbJoPzHGAqAk8zuhT55oOEY6LhlTMYwcLPViywmT1bnT/QIChg1EMJGhKNLF8
         xjnw==
X-Gm-Message-State: AOJu0Yzm8feEcfGGJS1zhNMv7yHYlDEt1vyiG1oiZmxG1K9BCBinLKQi
	N2Fv0CiJTxkHRzrZk+Rx+C/8xAidVsZK/zizbfuk6sOrTu5hJGJm/+UbNFAgkZS5Vo2pP3ctuKF
	L0Tx4fUkfoBqeuttqOEg7g6HjSYt23Xm8R24z24Qy/tL6QQpa6jIgI4JkvTxq+qzEuWYlQpU=
X-Gm-Gg: ATEYQzwAfpxnPf/6WTlkafgg1JeFy0ettVjxAOG6EEOFjE/qonEpqhkH4A4zPMyscW6
	fN04vqg3kNsJuL0/vARFX2e+z6AfE4vnIr2ws8v4eE9PpeGDTEaJzbmvPsfQmfT1nKwq9Kxo4VX
	MvUhDGA8qC8Ma2ebXNc2oOETpIx7OwWwF5TNomfyVZbNfJfZsDYNsx4npKWn3+fBqnujAkqcTwI
	OE4fZ0azilt35exUITPIhQsQQe+2KEPu0COfET5HIknz3mFK4v6/g9CIf91s0ma6DBSCYeprk0S
	aQsKvkZqRoJLbZ36zk77kaJBKNHQcgFg5QPVMfKFIMl/5cYV3SW4bCsBWdOOCwGjpp6dK+8ZySY
	FO23gkw3iYgCwZ6QOTJgL7yJdK602Zv4bsq8hP+yaaPop54u4TICM
X-Received: by 2002:a05:6a00:84e:b0:827:2dea:8840 with SMTP id d2e1a72fcca58-8274da2f92fmr14458819b3a.56.1772535929286;
        Tue, 03 Mar 2026 03:05:29 -0800 (PST)
X-Received: by 2002:a05:6a00:84e:b0:827:2dea:8840 with SMTP id d2e1a72fcca58-8274da2f92fmr14458786b3a.56.1772535928621;
        Tue, 03 Mar 2026 03:05:28 -0800 (PST)
Received: from [10.206.100.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff3667sm14933543b3a.41.2026.03.03.03.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 03:05:28 -0800 (PST)
Message-ID: <616f5563-0b5e-45d2-9d6e-ec333c670d3a@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 16:35:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: venkata.kota@oss.qualcomm.com, kssb@qti.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: add ADSP, CDSP firmware for sm8750 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7E3RyAu c=1 sm=1 tr=0 ts=69a6c07a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=qC_FGOx9AAAA:8 a=lol_4_AL-8xOz3G1Uk4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: iLXXuHPlUvtAo_sL8NnuPeHFmp4_E8EU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4NSBTYWx0ZWRfX0DcQ2QcuIRKT
 vciYqTRh4CB9ZyVKDgVvqGyGHAacYj/PSBp+jfpj/Qclbph8uIcES2q9Et4FI+2NGNnCQQAN4Zu
 EMTGwHKccmMSQuCuwBSkrXAGF302y7PXMNScIeSakN56nKbxy3ON8qyNptsAbhxKkwr+RwNgKuW
 y6jBYZoEjxSvfEdTZMLka/nxch1+WYZA6Rztc/orjYLf1syVJqSPhcxHXmoIG1XRMnblPfGK/D1
 JgL5xJyuGjGQ2l1r40JFWo4IjkCNX9ZuxORmP7xpYujBjx7sZv6L/FH87ZMdggOczRwG3OvhXh2
 EgUBW23ValT9CVaeembZBFuhahONVGZePinrd2lEV51s9+XPIAS7YP1LNAVpZoeEfAGfhtFzYwD
 54u9Epj4or5S6btHWmadrawnW/0H2lO1xWv05xXYjwhgDW5jsb1cmhTOBdmJE76foekE4k+v+o8
 YudJL2EMLG+yzOp0DFQ==
X-Proofpoint-ORIG-GUID: iLXXuHPlUvtAo_sL8NnuPeHFmp4_E8EU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030085

The following changes since commit d8e138dd8970ffc9f5f879e2d62938abe6cd3f22:

   Merge branch 'bt-hsp' into 'main' (2026-02-26 14:52:51 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-sm8750_dsp

for you to fetch changes up to 59e01db298ddba41ff4aa7c94da332b3d868f8eb:

   qcom: add ADSP, CDSP firmware for sm8750  platform (2026-03-03 
16:32:21 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: add ADSP, CDSP firmware for sm8750  platform

  WHENCE                   |   4 ++--
  qcom/sm8750/adsp.mbn     | Bin 19421576 -> 19413384 bytes
  qcom/sm8750/adsp_dtb.mbn | Bin 180024 -> 180024 bytes
  qcom/sm8750/cdsp.mbn     | Bin 3912104 -> 3920296 bytes
  qcom/sm8750/cdsp_dtb.mbn | Bin 36664 -> 36664 bytes
  5 files changed, 2 insertions(+), 2 deletions(-)
