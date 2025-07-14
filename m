Return-Path: <SRS0=9QRH=Z3=oss.qualcomm.com=akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DA1C83F1B
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Jul 2025 15:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D63A0C4CEF4; Mon, 14 Jul 2025 15:00:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16AB4C4CEF0
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 15:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 16AB4C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EEvhLq007869
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 15:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L0opJbxZ/ny/Wm8hKbTo2b
	KIPRWibALEb/r9B22XN7Y=; b=mVBVZDT6NGn6IuE8dYW2L00NL4BfgI+pm9E6rw
	0WsxgILXyGOc8TLcbFAHzTumRKIuVNF8XUkOHtzJy9lvT1t3uXDI+ut8NDUfa2VQ
	WKCBk76/9xowmSEyOewMTb70+/57D+2I8qgvkyqsvsgDo9XXGTZBPtv2F52nlEdB
	2YINslzTOwbapNOh0i+aQl4qGGNdO9lnRRyCYIXGrdUYiIyEnLzzqH1N8wpaRE8G
	YUSmw/aotv0N2km5AK+ShivL4R4M3wTOrpWGgs7sLUhOlZRkFNqradElfEPi/GkE
	5iNhwKisiSMrW6IBblbb+pgP+dgOA0pCE+h2VxR7B8ajG6jA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vwghhbev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 15:00:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b350d850677so3176928a12.2
        for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 08:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505251; x=1753110051;
        h=content-transfer-encoding:cc:subject:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L0opJbxZ/ny/Wm8hKbTo2bKIPRWibALEb/r9B22XN7Y=;
        b=KXCCHcO4zjnhkUuSNgN4YsCuildUqp/bFXBwHRsxYwfefWgE8UlW5wdDSL62cUcYWM
         x0rQkfKNtW/DFwL/2J7EZ3iiu1zKZM3HAMgYwGnGUk2rXF7y0JMSGk61BdZaCzvmhqpG
         5QyYi6PNig+bXnlvai+TPu2vF0mQ0rReOULlBz/dEXxFYqphiKcHqmtXUGNgyckRjL19
         E+fvK52cZ7AZbLt1epmpXcaMZc72/gw//paT/yxrDq3whRTwcqBmOtdaqdibPnMGE9op
         KQheGydxMY5e23Qw8pI3tli/dWoHdOQ3bfKd8a8+l6tRkqk+4WERqk+6S2/soi5Nv574
         dRpQ==
X-Gm-Message-State: AOJu0YxhCInkdJDaqeaZFIL8fthBqIHk+4U2904+wl9PJWb7+ElzatFx
	FjK5uPCRIRIDnEHAKPka7LDOYz0FxP69qxkuJfUsAdw6Zzpzl4Yzb3/Qeics2kYCn9uZg7toi9N
	rbN0/I38Nq86djpjrTf+gAMK/n4ijFIHJN9CKZ6+zGnjYyCKvrRpVHqPzuu85LC0sYEOTRa8=
X-Gm-Gg: ASbGncvCssG9k4vqt5nrVTTu72H9EVSXUQh6+1VHmzmtBXkXgEqOVHa8qJNw+p0614e
	hQ5t/kjNnO0msYyoT4c5DT9sFw14+hlPkJBPUzurO3MUTAuySskupePOjCUzKAvea6FW613F3F6
	0FaiNoEcBy4tbjDjXRcpFIjsWR8hydhWH+PIoY5Xd3xxj+ORDeDsDBXzLbDbljgqYqsN0CPnn0m
	phlRa2Ecps7uSLagdLiOt1m7aVVsn9Bi/3G0llBpA8HHpL9zntXaIPs/G+YBNVPdWouQ16hLe5d
	OA1kuwVsZTKlNi9hDJ/8jUMQHguHGbPl+A4tnemQ9h4JkuIpFE7oNIav1eg=
X-Received: by 2002:a17:902:f707:b0:234:9068:ed99 with SMTP id d9443c01a7336-23dede860afmr243142995ad.24.1752505250785;
        Mon, 14 Jul 2025 08:00:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcThTtg/fTVn64s9WoTg/FFm3W5xxNFIR1RGFLdpktYaDpoe/TVsT4pxQU44HrDrIintkWAw==
X-Received: by 2002:a17:902:f707:b0:234:9068:ed99 with SMTP id d9443c01a7336-23dede860afmr243141445ad.24.1752505249873;
        Mon, 14 Jul 2025 08:00:49 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.230.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de435bb36sm97605385ad.232.2025.07.14.08.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:00:49 -0700 (PDT)
Message-ID: <10ee301c-7549-4a97-8e74-45329737222a@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 20:30:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: qcom: Update GPU firmwares of QCS615 chipset
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EbLIQOmC c=1 sm=1 tr=0 ts=68751ba4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=J4hHMLXUlZdx2gNTs44xtA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=19WyUhxMObQSCQBfIC8A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: dHalsXYNINWfU_vGvhIQQguH-b5wyjYJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA4OCBTYWx0ZWRfXwaU7JfPIBLHV
 3bRUMc3y5FuVyxJgrHO3w8fgRUE6Y+iGRtpjlYMbWmu8enuJ8yuP/AxqV8vf+erPe31eiteXnB0
 94Ibb7lDw5iYqsdgv8RQZydNHjhuatK7zoBAlRFqN6jpdVYuhsdp6PxTkhVv7+48p0ZtXa0fcX2
 tvV0IK0TK5LHvH6nD77uPruoGvo4GJZaa+P/oha80lS24KpMDiZepWqlmdfPJIGYiX2+HTnT65I
 v11VMWRFH28vV0JHWE1SDpGj2B02csr76iVuhjxV57SAT3374e+kxyffycxR2ySEix3EVud4u5C
 H6qSMoExnJqQ2GaH+EQ/4DtYee1if0xF+6v6YoKJPzroZ2hRdRYU47T/SDHr7c3RTqpgaZ/ydLL
 GZkYH1SQJJxEb+LQgobo1pyM8l2REBWoPqjkGCdRW2oLS2va8WlGtSxu0EHxQQVK7rg+YQ++
X-Proofpoint-ORIG-GUID: dHalsXYNINWfU_vGvhIQQguH-b5wyjYJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=495 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140088

Hi,

Add/update the gpu firmwares required for Qualcomm's QCS615 chipset.

-Akhil

---
The following changes since commit 99d64b4f788c16e81b6550ef94f43c6b91cfad2d:

  Merge branch 'amd-ucode' into kfw (2025-07-08 12:00:49 -0400)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-QCS615v2

for you to fetch changes up to 9e60f646cafc202d2a3613be7ee277e1a84c1cec:

  qcom: Update gpu firmwares of QCS615 chipset (2025-07-14 20:16:48 +0530)

----------------------------------------------------------------
Akhil P Oommen (1):
      qcom: Update gpu firmwares of QCS615 chipset

 WHENCE                   |   3 +++
 qcom/a612_rgmu.bin       | Bin 0 -> 3072 bytes
 qcom/qcs615/a612_zap.mbn | Bin 14256 -> 2977 bytes
 3 files changed, 3 insertions(+)
 create mode 100644 qcom/a612_rgmu.bin
