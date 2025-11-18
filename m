Return-Path: <SRS0=041a=52=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6708FCCD19A
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 08:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21C13C4CEF1; Tue, 18 Nov 2025 08:49:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48B15C116B1
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 08:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48B15C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8VUoX2250242
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 08:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EQe4zbbHV13Fi8ju1KPZBG
	Tm9XzlNORgoqAAG8GO3cM=; b=VHAhNvV80Dw29Ur1shDVXX7kLCa1tFeEoIIIGj
	3ybdNC1K+ThErYk298cTtzr6zTWj26HXeVC8/6s7un/yNXTiCG0mOVzraVuVKOP/
	CYMi2ziZwCA0xgELXYRIEFqAKKzGO4yWeid17LnXeZzEyUvAwDdhEKZGxj2ohNzd
	N+zS5B8vd8tWtksTV4mSJrLEIlpkAennK14Td+XZJ2MKlYd9XH5fEf4Uzlh4HN/C
	Z2wACdquaDgPGS3SRNQKDdfjoX9EFINSPjIqIZ65vA7cM4NS3BqWcVH7zR5U4ZwW
	AzKn0VPrjU3pE0G6GUvwB9+AyfqsU/Kab/C9gdyUFthci3tA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnc5g1e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 08:49:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3416dc5754fso9884169a91.1
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 00:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455741; x=1764060541; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQe4zbbHV13Fi8ju1KPZBGTm9XzlNORgoqAAG8GO3cM=;
        b=E06xCzOm37OXTiI5rWQcV2q2s1tnfkI2V+26ecMSdRuT7oOdHcK7aWQ8Gp9SreyhCx
         q3M9wrSDZ00HAi0ch59oWa5JkV7SlK+lrjTWnjk/bEQxLIK+5+6K4FSl1eKIDBH1vOKe
         yFZKg8VI4JjdaM1tt+6YR5PbYD4NiADFe1yfd6oW1QcJHWhTfGbK9UnrQGUc5Hcy5alF
         g1zbhVP7B0OdlnBYaBT7BMI5QjT7eXmcc/G4e8r6LgWOR0n+cjgkWZtimncc5zmJmHDt
         irSzTqEstu7mPRhVtTvyHb0QXsZiCA6WjqmtVjE09cVJaviVChtnIvJPxgrjKBcD14Zv
         LaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455741; x=1764060541;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EQe4zbbHV13Fi8ju1KPZBGTm9XzlNORgoqAAG8GO3cM=;
        b=Og+sZFWEiCPuOUMHyNegmvH/hi3ZTA/qbQyRE9PsBEHe7rz4FC++5nspwJcYTpZZ0g
         w0zpEGr3U88J4VUk/U1iqtfhqi/s4xyZGJAVpiSPBMCZ6QNyd2yDmPd4oWKyz2+513UA
         xMptha6Z8W/jt9AcIRgPl0B2uuuZt1/lRZnERhOmHHxjOpw+3dJtlF/lRgeG4abcceo2
         jTq+coD/sHXUsjeYKrNpz0guruHVbbSJI4zTNFfR7qp8y+f7ROTV87ANUPa8wviZIKcB
         iU48zCe/Mpg2bRy4AmpOQjcJCHr7rB+CZsfTDYSygMBmQ1WlIaieoZ22hBjnIF7oWqRA
         VZPQ==
X-Gm-Message-State: AOJu0YxrW745vHwOAuDpO2Iq4agTULLyho9tDWH03E61rPIweETn5Nv5
	Qcz1BC1Y2n9RmyW24LcoNIUUxSABoe3o62CdHUBImoYtJHCtIIQ9x2FOjqVBlcppMfL6UYBFSm9
	7QlG7Ggw+n9h7NTpkplAFnFZ00EXAmOs7JQUwjupNaf/6U5DI1Or/OiEFKOh5+zugqwg63+w=
X-Gm-Gg: ASbGncuX+h1Ndm+QgSpgMZ3yqgbKabpF6DvrYkULKPLKOeCKXHracq/EGUfVynM18Li
	wW0jrJPX7sqepXkIOULb4VSMT/DSJPe031Yi0ROQ3QoclyyAeTxSuTpC66wrKRLG8poNDiFeaOQ
	b7fdRxDzXJut7fgw8hagdU2iemJPaZDMzOK6Oli8gJvY1dwo6d1oIgM6VeKr4KLlTACO9sT7UY1
	MrenGDkzYyyJG2+rNpp+C/XS1f8M+nbY1ZPp0RrUZ/NIAL/xAv70gvk80TuVy4Pm0Cr4oPb0vOC
	ZhCiMhYXND4u/HMFRAK48Gq2KtsoqlpdCK99q/aCF7pZ3RckKVJNFNEjRYDvrF6mLo/VUINnHNa
	3MHUqX9Xny/xp6xbtoKCjaGzGS7s7
X-Received: by 2002:a17:90b:5684:b0:340:c261:f9f3 with SMTP id 98e67ed59e1d1-343fa0ded74mr17085451a91.14.1763455740911;
        Tue, 18 Nov 2025 00:49:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGa3lGv3bwnxCTNqGIGBWzBjrrrV52ralsuxP1NF2dfYLgq9DTqBmDYRhyxv7ymUkvIqxURA==
X-Received: by 2002:a17:90b:5684:b0:340:c261:f9f3 with SMTP id 98e67ed59e1d1-343fa0ded74mr17085431a91.14.1763455740442;
        Tue, 18 Nov 2025 00:49:00 -0800 (PST)
Received: from [10.204.86.168] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345900a4ff5sm6939264a91.3.2025.11.18.00.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 00:49:00 -0800 (PST)
Message-ID: <8232a96b-7b83-4c12-8ebb-d2ddb37a3fa4@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:18:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: psaddam@qti.qualcomm.com, kssb@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: add ADSP, CDSP Firmware for Qualcomm SM8750 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UoxGao4yCIpxDoWLJgp5Sc5TnSpZWv8L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX9MfZqD2I8Lsh
 ZSM8oULSPvWenENNpYDtAeLmNCCqFG6rYj6/l25OJYlxVBA8Kz4yayN+e1JxP1EHTlxzq4TCy8m
 ys0/kcxS0dSqTcqZhp+1fogrerjuR9Lkd6jfhz52mcnsla+ZqEgEo015xEv40lpoet5e2HassX/
 2PPIe/gSsAiWrzPKNh2/njFDpdwEscCQI/tFz6cFsjqd1tW4fHoUf4UManAylCpAxW1K637LYE1
 jfmRolBlLjnYwiSwczV7DffEHrATe/PCyufUd2/WO7tu5m7g5XwUbrto5HZDDr6cNBDvTglZ39u
 BVh78TCzmVYng7VfLJ3Nobo/hRaCtRuuhleS8IQyrWrHHAkHi84TPSs1EjCYwaP3bGZwiZ7k5HO
 BcVjwVZP19pzXU1LmQJRUzWcUst75g==
X-Authority-Analysis: v=2.4 cv=BYTVE7t2 c=1 sm=1 tr=0 ts=691c32fd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=wANDPbot73fbpfn_ViMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: UoxGao4yCIpxDoWLJgp5Sc5TnSpZWv8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069

The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:

   Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-pakala

for you to fetch changes up to de779eb0ffa254343e2acce6b9efc5bb304f73f6:

   qcom: add ADSP, CDSP Firmware for Qualcomm SM8750 platform 
(2025-11-18 14:12:51 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: add ADSP, CDSP Firmware for Qualcomm SM8750 platform

  WHENCE                   |  11 +++++++++++
  qcom/sm8750/adsp.mbn     | Bin 0 -> 19421576 bytes
  qcom/sm8750/adsp_dtb.mbn | Bin 0 -> 180024 bytes
  qcom/sm8750/adspr.jsn    |  22 ++++++++++++++++++++++
  qcom/sm8750/adsps.jsn    |  22 ++++++++++++++++++++++
  qcom/sm8750/adspua.jsn   |  29 +++++++++++++++++++++++++++++
  qcom/sm8750/adspuo.jsn   |  22 ++++++++++++++++++++++
  qcom/sm8750/cdsp.mbn     | Bin 0 -> 3912104 bytes
  qcom/sm8750/cdsp_dtb.mbn | Bin 0 -> 36664 bytes
  qcom/sm8750/cdspr.jsn    |  22 ++++++++++++++++++++++
  10 files changed, 128 insertions(+)
  create mode 100644 qcom/sm8750/adsp.mbn
  create mode 100644 qcom/sm8750/adsp_dtb.mbn
  create mode 100644 qcom/sm8750/adspr.jsn
  create mode 100644 qcom/sm8750/adsps.jsn
  create mode 100644 qcom/sm8750/adspua.jsn
  create mode 100644 qcom/sm8750/adspuo.jsn
  create mode 100644 qcom/sm8750/cdsp.mbn
  create mode 100644 qcom/sm8750/cdsp_dtb.mbn
  create mode 100644 qcom/sm8750/cdspr.jsn
