Return-Path: <SRS0=0vEx=4E=oss.qualcomm.com=jeff.hugo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF762CAC5B1
	for <linux-firmware@archiver.kernel.org>; Thu, 25 Sep 2025 17:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB027C4CEF4; Thu, 25 Sep 2025 17:49:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD986C4CEF0
	for <linux-firmware@kernel.org>; Thu, 25 Sep 2025 17:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD986C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9Zj96002114
	for <linux-firmware@kernel.org>; Thu, 25 Sep 2025 17:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gX9DRscpkhjxfgEzU7f3Ex
	PfamWLQ5MYLdcslTgFtyg=; b=hpuWLfeBO3GO6tW+8eAmrAhFvRUkck2AUx5qih
	lTU4jV7e1Zojpa2RnRdjOsz0B2na0HRGBFS6sieUTtn4FVtZOX5M35pdqmu7K4jI
	qmlMMN0ptSOoPHqs08uk8tHCVm5IiVt2mhNm6qlJgb5UOckJora3Ff0sSFDuDe5E
	yCshhGQyiK+6GECUFYSb/T47h/aPMDI6QzlYUBXtCBlN24H2uGQCmhNI5RFLrlnR
	Vf78c8eDW3BqtucvMqxC8eByexYZFsJ8J9sriALjrL08GndEHVdGZB1KYVi6ipP1
	e8GBKMxnI6Olz9XWNL0zwLNceucJ6BKE2brrsjlcTjRg8Hcw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98s1xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 25 Sep 2025 17:49:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b471737e673so1565729a12.1
        for <linux-firmware@kernel.org>; Thu, 25 Sep 2025 10:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758822570; x=1759427370;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gX9DRscpkhjxfgEzU7f3ExPfamWLQ5MYLdcslTgFtyg=;
        b=jZj9Y6DT+Aa5CM0D662hEGy8GBsUi7JgSsnmqEKmn+JLFHXiLhuu19Yq9ZTOyxDWRs
         c5RJdutZRc6mHYXCl2+APfY1c2/+nlVukMyOUWNC6itnMNsrW2wjn9z/Ua8o3rcH6N+4
         +gDu55DQX8KEYg6hJJn5BpxxPY0y0fVy8LC77CMXX12pC8b67q3pq4134XsRWuQbbmn2
         bKi1V0k4SCabDymLkRYpRHu4SKLFUk2gDA89L3UFlsf6dAFcHConGkIud9w0FeaDCmzN
         8GtCGTZZMdGTyo7R/2foclV4uuHyeQFfQnRBndf4S7Tug9RJ3AbIV3qs6Z662YyZ+ddI
         Mudw==
X-Gm-Message-State: AOJu0YykdThlQkOaEtPcEjryk+zOmzQcGTa0MnZJAWPKU9IUROZzQ7I4
	cU9ittmUnwRSXqFa3DMaLzSIuARN93vFVB6pZZqXWbVTjYxOGwia9933R+TC+irp/NIDVuR1wVO
	vuC1dTgT4UwgcNZmlrZfhVu5IsGVQAPUYI96/BL96MQOxWxa6U/GND7+GffAqzbVTcn/JT3I=
X-Gm-Gg: ASbGncuYlfROFX+m264rEOlrJd/jyI3IagIjE6LHVjr5IEAvJjB11YpWySWhpUCUzAT
	5TVwQ5+uWyg8z+7AAsIGDpicvdI4wh9WfQKuHa1YrGNsAwEhN7smtnEYgE8OsE/jSe9DTxzdbeE
	ZQzuUa2+r79Dz5+fql4CPPHiVbkpF/Qezx1v8OYDvoe4VHWXFVnVGiumsG4IB995ckMZhdeRWsN
	QiE8HeE5M415uQgN9xknxXKU9H9mbmqOdAw065vAAxl6CfvZfRABbnz6pNLLHOUm/ySONprRWWQ
	IzTz5HcX0A5xYMPDPvA2xS9THMzL6T+QzLLa1Pfh/KxGyTp1gaoDfcLRVppCKRRBXtSsHU+igi9
	vQJUKVBcaqotLww==
X-Received: by 2002:a05:6a21:32a0:b0:2e5:c9ee:96fb with SMTP id adf61e73a8af0-2e7da1802e9mr4868609637.59.1758822570188;
        Thu, 25 Sep 2025 10:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg2DPinpmga8mmhZpvMDR+SEkL5C2TWcjGjEd3RIihfvAtnbRl78kmv6NcBhgLuffbNiaq0A==
X-Received: by 2002:a05:6a21:32a0:b0:2e5:c9ee:96fb with SMTP id adf61e73a8af0-2e7da1802e9mr4868589637.59.1758822569672;
        Thu, 25 Sep 2025 10:49:29 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53db8d2sm2702839a12.24.2025.09.25.10.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 10:49:29 -0700 (PDT)
Message-ID: <bc9e546e-d560-4088-a6ea-937009b8343e@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:49:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PULL]: Update firmware for Qualcomm AIC100
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XTmGrxELofuy_E92nKS_rSW8Becd6OqX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX91qxvCVa1tah
 p4u0DHVhHvY9Dn2Vsa51sfbInUwvz3KXCtEH9A8JShb4aWEHtDLuF1dT8ZNWwDqIo439K/A917w
 9qOEQohYuJRIU1ZGxNOASObbrbV9qBPfHMv+NBTJQNlmXWmhaWNph148zMVREnlHqiKy9hrZjKt
 +VjZhJc1qfI6dozp+PrqzZSav/WszWawQUZN/EHd+xIACszlByTRbjVfAHsmPB612yo84/AAxO+
 qnC0Neuei88a1GJvNCrlNLzPa2OmSzi3eWmZ6xM72gcpospqEsxscoL+o1o+dXRXrVCV/B2b1n2
 7bjki47dKuOEvoMdUkqVbCYjBT0lnoyOS8VEqcCDLLQhX2AEgg/HrL0FxsjQrkPmt4GCVYcjM36
 3NvWKCDE
X-Proofpoint-ORIG-GUID: XTmGrxELofuy_E92nKS_rSW8Becd6OqX
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d580ab cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=adjwM9f5GbUSincbSysA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

The following changes since commit 1269106c61a34b8f65d045c8045df880083bd3b1:

   Merge branch 'amd-staging' into 'main' (2025-09-24 13:46:33 +0000)

are available in the Git repository at:

   https://github.com/quic-jhugo/linux-firmware aic100_1_20_2_4

for you to fetch changes up to 19c12c41c84187a9fa1df1b58bb6f72a181ba620:

   qcom: Update aic100 firmware files (2025-09-25 11:38:38 -0600)

----------------------------------------------------------------
Jeff Hugo (1):
       qcom: Update aic100 firmware files

  qcom/aic100/fw1.bin  | Bin 2135752 -> 2180920 bytes
  qcom/aic100/fw10.bin | Bin 249439 -> 249439 bytes
  qcom/aic100/fw2.bin  | Bin 783512 -> 812184 bytes
  qcom/aic100/fw5.bin  | Bin 24576 -> 24576 bytes
  qcom/aic100/fw9.bin  | Bin 762704 -> 787280 bytes
  qcom/aic100/sbl.bin  | Bin 1048576 -> 1048576 bytes
  6 files changed, 0 insertions(+), 0 deletions(-)
