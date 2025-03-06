Return-Path: <SRS0=tLei=VZ=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A4DC282D1
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Mar 2025 07:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50364C4CEE4; Thu,  6 Mar 2025 07:57:13 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21848C4CEE0;
	Thu,  6 Mar 2025 07:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 21848C4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267uC8v028476;
	Thu, 6 Mar 2025 07:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/WRICoSn/eNSKWE7QrA2XA
	lvvIRf+nSwz9CXM0sknlY=; b=V2pR9N4D198jabYXLgpdyF2MiAJKhUlO6F23Zi
	dqMNHuEO2pgzyAIDKoOOiAzV+w/R8OlS+U4IIRQGaaPtLoM7lUCxfpKoqG10XEyv
	GpSXKqwNHS4Gzw3f/EAV3XFFwPIprcqG5gOFxXHFnvWnOsRvmUgdpN7mHxRjADsg
	HsDoeXry6gHROuh0xTLFSi43kc1RW4z0AEcNSYGp+TmZ38hEIXGiGvVV4AsDY4Ay
	1/E3Tg9/4ORmO38KcfEvddP5RSI8+zBHxfiHAFMbZOrUidju1CAredfLA+fBGFcZ
	MmeL31KeKvx+B9As5BtjF1elAxfigFawzUJaAS5Z2rEy/xzQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577rpg036-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 07:57:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5267v99Q001960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 07:57:09 GMT
Received: from [10.133.33.63] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 23:57:08 -0800
Message-ID: <628a50fa-d0c1-49f6-8df1-9a7e9abacb58@quicinc.com>
Date: Thu, 6 Mar 2025 15:57:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Zijun Hu <quic_zijuhu@quicinc.com>
Subject: [GIT PULL v3] QCA: Add and update Bluetooth firmwares for WCN685x and
 QCA2066
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EYQyQOmC c=1 sm=1 tr=0 ts=67c95556 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=q-IrZ282f3VL8_vYvi8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: yfxaUcO1_KrjTycOATNV0i7EkPxlO3-H
X-Proofpoint-GUID: yfxaUcO1_KrjTycOATNV0i7EkPxlO3-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=899
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060058

Hi linux-firmware maintainers

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit 41a528251649772edbcb705a40e617fd14858e53:

  Merge branch 'intel/guc_70402' into 'main' (2025-03-04 19:09:49 +0000)

are available in the git repository at:

  https://github.com/zijun-hu/qca_btfw qca_btfw_0305-2

for you to fetch changes up to f573fa75ee6cdc6d176cadd0e63059f6c082928b:

  QCA: Add Bluetooth firmwares for QCA2066 with USB transport
(2025-03-06 15:43:38 +0800)

----------------------------------------------------------------
Zijun Hu (4):
      QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00653
      QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00653
      QCA: Add two bluetooth firmware nvm files for QCA2066
      QCA: Add Bluetooth firmwares for QCA2066 with USB transport


