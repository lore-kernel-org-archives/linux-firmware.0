Return-Path: <SRS0=PEt3=4J=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF24CAC5B8
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Sep 2025 17:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33C11C4CEF0; Tue, 30 Sep 2025 17:28:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C0A3C4CEF7
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 17:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C0A3C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC3s8d014983
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 17:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ppVOdpg6S+WiEchyCmry/4
	lRWI0phEn5z3lhUaVv+UY=; b=ZZL4cAO/+MATzgmpWE0zs8rgDcFq/avHPFK3X5
	wvb/8YZaNA9ucXn+yDKe47ip353uh0ho7rUHCXejG3WbSrYIblYwFAvAJITX7BXh
	uqcxkCjMk3+ZiGdi05pa7Ri6l94zbI9y1NG+4t+Wh9vuXj6kgdw4sK80LU/Ok4YA
	i665YShYn8bJAVKhYx814L/O0V27wbnpYcFKfaoZG02Bu/EzP40kNDSMIYPS1eD3
	kZ0kW24YjBmuTLwbHA29+Sb6NE2CmYIoyNbOZYE0xW8O5TCmk/tS9k2UNKaBzixz
	cviJTb8C5kgiq8NV3+MiBm8DkKsADEOxnICI3+F7pGcx1YsQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr1v00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 17:28:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b56ae0c8226so4280832a12.2
        for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 10:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759253300; x=1759858100;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppVOdpg6S+WiEchyCmry/4lRWI0phEn5z3lhUaVv+UY=;
        b=AI/B+WG5s3HkvZZDntZtqA+ecM9tMyiGIKDz39YvSTQ7MLJXmjl1haEJL9GsTz8V8v
         ytiNIkmUDefMnAtYajn6ecklPNNaAJ6F+lCi/5EwfXE9ftgIaM4k5lnkmwNGrT4U9zE8
         6nON3IsrCcmr8OTOHXpMpn7qv0tKftSTt+CVr5efoWx7C1xLLi6V7B34cely0q7TEE0W
         5bCC5btzOJL7x/bEV2qGUoE1kwYfTXledzyCIf+uJAJDYK/2C94uIyll0dHMfveEwkqX
         PWZTBQ2o0wv7qGXmO8ZuQoAs8zobNviIqZAyDzlzBYJHhKM5jT9R/NgeTnCzIftB8246
         eU6g==
X-Gm-Message-State: AOJu0Yys96JY6I8S/fkTk4h3W4BaylCFtUMmpqyA6E8WOq2jnyPzTZuZ
	EDCLaT6Fl9EH6eTNt0m98HRp9vTDAITc9beumFJsUgVpUJDg8KYqHf2QMA39tHc2N0oMdlyyqJ/
	k2MxS25m8eL1lF/5UbdmnxO+h8zTOiPFzF9HCHHGzPSln05UCrYAcXj17sEfUCS1gHLQOR3di9Q
	==
X-Gm-Gg: ASbGncsS29ECrFrq3viucPJuo+betC4HOd/gTd2QHX8qvgIvpFJi+wJB7o5K6/Ioz69
	cpkhwB2pT37OcID4zCFjStw+RGIvuJmeVljhZP41L2XAy7gRZqSnqu4294kwfhw54BwjVeaA4xJ
	IblfD3W1/iAtbqdJpORlDJMChKUAsYne3/v/ExAhYlFrcUH+hbD2TWpQUTdp6Q6yRCfVcrajQWB
	8DAXn5VBWb4yDhm5YV9LYoKPNjELxli6AE+R0KjS7V6MwVmSOcXFX5yb/+VHg8fs5yHMKKJ00Zk
	iYUixfJp4lOGdvv4mz/ylzhgJNuk8mkdWSr0QSmG+WULx9eMYuJVY6Fus3qSIkhT7xNVq0lKDY4
	79A==
X-Received: by 2002:a05:6a21:7a8b:b0:2f6:6d95:69db with SMTP id adf61e73a8af0-321ea890c2dmr686085637.57.1759253300183;
        Tue, 30 Sep 2025 10:28:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOQjb5C/RLpbORB5gL4cO/vIiWdOe2x5+7FV0eGpIJHgXf/IzcWDfmeudR9xxBcNotCUHIAw==
X-Received: by 2002:a05:6a21:7a8b:b0:2f6:6d95:69db with SMTP id adf61e73a8af0-321ea890c2dmr686032637.57.1759253299606;
        Tue, 30 Sep 2025 10:28:19 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06e67sm14099840b3a.91.2025.09.30.10.28.18
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 10:28:19 -0700 (PDT)
Message-ID: <f86a00e7-3622-4029-894a-13b575262a36@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 22:58:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for qcs8300 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dNqD2CdyCq7392DXXgpdENwgO0GfCg55
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfXzXd7aGgpvSXb
 MvaRwVTvcmd+ATOlGBMkg45Ts6LjU6n5J1L2HmC5rGqXlS/q5RmjQy7oIU/OoXYdUmnJZZgAXAx
 0CTfLfVw+9TBeTZAAsqxO/h7KndY8TEYCXc/1u2pzFAztHiToU57nDp3DfqrKktGDuXPy60k3+o
 5hSZ9lJKwTF0TGSvCmYUoKRjx01xyv0E6TyUjK+/aTj2pe8QimGpkrWYDWItpNOXlJGQd+TcvC0
 PTSx4YOOuPs5oQ/8M33yYC27CiAyewaRlEIcxMM8KjJTdFNKRD19GI+BIYVdjXs7e/282SiloTW
 GCGgHEtOLVJuUijKPzrWhypSLTTcPHIrZVxRiZTkT/NoGs/rq1PNCQZ/S2y57dRO+y1HEM092fh
 mIOoB7JJbE0P+enidoxuWK1YIBTSWA==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dc1335 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=XR6v-_ntFxsetChiJYAA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: dNqD2CdyCq7392DXXgpdENwgO0GfCg55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017

The following changes since commit 2725800a9b5c532fcd1bc6c1502cb4678463416d:

   Merge branch 'main' into 'main' (2025-09-29 11:56:44 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-qcs8300-dspmon-163

for you to fetch changes up to 456617792f737ca068475cbd6736bf3971b0fa4a:

   qcom: Update DSP firmware for qcs8300 platform. (2025-09-30 22:54:40 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for qcs8300 platform.

  WHENCE                  |   6 +++---
  qcom/qcs8300/adsp.mbn   | Bin 6684672 -> 6692864 bytes
  qcom/qcs8300/cdsp0.mbn  | Bin 3080192 -> 3096576 bytes
  qcom/qcs8300/gpdsp0.mbn | Bin 5873664 -> 5881856 bytes
  4 files changed, 3 insertions(+), 3 deletions(-)
