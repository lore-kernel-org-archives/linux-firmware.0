Return-Path: <SRS0=Kj2k=S3=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A10D10DDD
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Dec 2024 09:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67B76C4CED9; Mon,  2 Dec 2024 09:35:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BC75C4CED2;
	Mon,  2 Dec 2024 09:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5BC75C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28Fv5F019971;
	Mon, 2 Dec 2024 09:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5uBNh3tBY2o+kowk5hHBfRUI/1VDf0R0PoIftL6CR+A=; b=FzjKprf3pAdXEyE2
	uH8pX7d8z+E+V59ZTRaQzQBiz3F1Df3cS2Ib3G2WlMsRoqA1XN1s1K7ROWidMcpZ
	a8QVvKLwKbv9kirXIH1piWETVHi/5vPmekzYDc86bZFOMkzx7PuxbHwfyE0fXIwX
	29Oi17V1CNRrwJZnrgh6UGDJvTy0iSsbAI2fURAZI4rSTgpS6jy9I6wx07AUicoK
	CMPZ07rlhogWDfDaMlyj5v4c9I/6uZzpbYuVwjhf5TGIoYLTICykbjUzZcJVecxN
	SHBwtAM+ZsfytU7k6kFdP2oWOu1/X6fP3ExjYqCHgU9LU7WFlT0NhJuGdxD88kzR
	udMRJQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437u36caub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 09:35:01 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B29Z0qO022252
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 09:35:00 GMT
Received: from [10.253.8.96] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 01:34:59 -0800
Message-ID: <ca537740-7b14-4aa1-9e8a-3566d33f1f20@quicinc.com>
Date: Mon, 2 Dec 2024 17:34:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] QCA: Add and update Bluetooth WCN785x firmware to
 2.0.0-00515-2
From: quic_zijuhu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
References: <50a3038f-2a77-4576-ae83-aee68735f2c4@quicinc.com>
 <ea966b5f-d2c1-4b09-a4c2-e492d371e3ed@quicinc.com>
Content-Language: en-US
In-Reply-To: <ea966b5f-d2c1-4b09-a4c2-e492d371e3ed@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zuspSfGELqLi0he7j8f1Plja-xTNZbMI
X-Proofpoint-ORIG-GUID: zuspSfGELqLi0he7j8f1Plja-xTNZbMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=970 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412020084

On 12/2/2024 5:13 PM, quic_zijuhu wrote:
> Hi linux-firmware maintainers,
> 
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
> 
> The following changes since commit 7c3031c18ab851792c49f594a4d43200d55a7943:
> 
>   Merge branch 'robot/pr-0-1732634796' into 'main' (2024-11-26 16:12:19
> +0000)
> 
> are available in the git repository at:
> 
>   https://github.com/zijun-hu/qca_btfw
> 
> for you to fetch changes up to 7f116580d9060feaedaed55eb65c63eeba59341f:
> 
>   QCA: Add Bluetooth nvm files for WCN785x (2024-12-02 17:05:12 +0800)
> 
> ----------------------------------------------------------------
> Zijun Hu (2):
>       QCA: Update Bluetooth WCN785x firmware to 2.0.0-00515-2
>       QCA: Add Bluetooth nvm files for WCN785x

sorry, it is my mistake to send it as reply of another irrelevant
thread. please ignore this thread.

i have sent below new pull-request as a new thread.
https://lore.kernel.org/all/5cb9ed4a-2c4e-4f6a-9277-840c25bc24c6@quicinc.com/

