Return-Path: <SRS0=egra=UF=quicinc.com=quic_vivesahu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1033FE7719F
	for <linux-firmware@archiver.kernel.org>; Mon, 13 Jan 2025 10:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7AC0C4CEE2; Mon, 13 Jan 2025 10:33:59 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB0A8C4CEDD
	for <linux-firmware@kernel.org>; Mon, 13 Jan 2025 10:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BB0A8C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D1qDOF012496;
	Mon, 13 Jan 2025 10:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GqKfHh00LPaJ5pBIit8bti8a
	DaIEktfIDVEMrgDBe6Y=; b=nkbFvM6UbU8kdmU8bM3tj0I87MAtBPW7E21X4Q4i
	jBucCXkhodpExwC/E0UlbfrtP/p4sZKgjx36iHvgOKRekc4yrwXkYqnKXZwgBOhl
	cFLbcYkDu1U2Iu5hYOGTilSc0hha7EqfNJrYCnq1MtQj2jbsFBdzsi09CF8ooqDa
	a0P4cq0DptCuV9DGqUT5/vub8UDxrZCkC8rdfYjybz0zn2iwv8YfQ9YGxdhwuoKo
	J4acD0yqS2cKQ/imVcjapb6UR+OpvXqrA1qYkz5I+mcmkebfk/dpzkvfhYhqBI1Y
	7sB7yFCjFyZppO4CRmDjLUL3yJf8htFYd0vjJiJFo7xCCQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444shqh4k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:33:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DAXuVe005430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:33:56 GMT
Received: from [10.218.12.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 02:33:55 -0800
Content-Type: multipart/alternative;
	boundary="------------XYBi9eJcAAsqW0kVyTocMQhg"
Message-ID: <2c5b8b1f-2091-4cb8-9801-86d9da6b1382@quicinc.com>
Date: Mon, 13 Jan 2025 16:03:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Update firmware files for BT chip WCN6856
From: Vivek Sahu <quic_vivesahu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <quic_janathot@quicin.com>
References: <88e8d87d-2b98-41e0-9146-916ebaf9dfcb@quicinc.com>
Content-Language: en-US
In-Reply-To: <88e8d87d-2b98-41e0-9146-916ebaf9dfcb@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tKINn5TAGvXVo3RDoeqnufj9V3C2N-j4
X-Proofpoint-GUID: tKINn5TAGvXVo3RDoeqnufj9V3C2N-j4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1011 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501130089

--------------XYBi9eJcAAsqW0kVyTocMQhg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

small correction: firmware files for WCN6856


On 1/13/2025 3:58 PM, Vivek Sahu wrote:
> Hi Team,
>
> Please include firmware bins for WCN6856.
>
> Major contributions : Bug Fixes/Stability.
>
> Snapshot of pull request is as below, let me know if anything is missing.
>
> --------------------------------------------------------------------
> The following changes since commit 
> ff68bad967033e2973d3a82e5b160813b1d43488:
>
>   qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650 
> (2025-01-10 16:33:04 +0530)
>
> are available in the Git repository at:
>
> https://github.com/vivesahu-qcom/bt_hsp_fw.git for/master
>
> for you to fetch changes up to ff68bad967033e2973d3a82e5b160813b1d43488:
>
>   qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650 
> (2025-01-10 16:33:04 +0530)
>
> ----------------------------------------------------------------
>
>
> Thanks and regards,
>
> Vivek K Sahu
>
--------------XYBi9eJcAAsqW0kVyTocMQhg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>small correction: firmware files for <font color="#008000">WCN6856</font></p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/13/2025 3:58 PM, Vivek Sahu wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:88e8d87d-2b98-41e0-9146-916ebaf9dfcb@quicinc.com">Hi
      Team,
      <br>
      <br>
      Please include firmware bins for <font color="#008000">WCN6856</font>.
      <br>
      <br>
      Major contributions : Bug Fixes/Stability.
      <br>
      <br>
      Snapshot of pull request is as below, let me know if anything is
      missing.
      <br>
      <br>
--------------------------------------------------------------------
      <br>
      The following changes since commit
      ff68bad967033e2973d3a82e5b160813b1d43488:
      <br>
      <br>
        qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to
      2.1.0-00650 (2025-01-10 16:33:04 +0530)
      <br>
      <br>
      are available in the Git repository at:
      <br>
      <br>
        <a class="moz-txt-link-freetext" href="https://github.com/vivesahu-qcom/bt_hsp_fw.git">https://github.com/vivesahu-qcom/bt_hsp_fw.git</a> for/master
      <br>
      <br>
      for you to fetch changes up to
      ff68bad967033e2973d3a82e5b160813b1d43488:
      <br>
      <br>
        qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to
      2.1.0-00650 (2025-01-10 16:33:04 +0530)
      <br>
      <br>
      ----------------------------------------------------------------
      <br>
      <br>
      <br>
      Thanks and regards,
      <br>
      <br>
      Vivek K Sahu
      <br>
      <br>
    </blockquote>
  </body>
</html>

--------------XYBi9eJcAAsqW0kVyTocMQhg--
