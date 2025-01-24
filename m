Return-Path: <SRS0=uAfI=UQ=quicinc.com=quic_vivesahu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD27CC0218B
	for <linux-firmware@archiver.kernel.org>; Fri, 24 Jan 2025 10:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8AB3EC4CEDD; Fri, 24 Jan 2025 10:54:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D3E9C4CED2
	for <linux-firmware@kernel.org>; Fri, 24 Jan 2025 10:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D3E9C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAkjf4007973
	for <linux-firmware@kernel.org>; Fri, 24 Jan 2025 10:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=RTaHcosisqXQMT0pMiH+vB70+UXQnZtKcqNDIBk5OQk=; b=nA
	eEsGcH5/hYol1PpfPXSmj+Qp+JfwXmZoy/iyvAu75G8V+VRis9nJ+UIg9DUOPOe8
	W49hAoP1qlGmhCTJfBsifNz2hGMcCRKsRpZmcBwKnXwu/dPYyQ4TYCSfIzCY4IZq
	pEod/SIhUjkVcDPlFy34Ja4vgDbva1InZx8WZIyCKV6R1nWg0hVhCuIgEDPLlo4Q
	b8PZAHvs6Hqlw33mnnnC18dU3Sal6iX0CVNyXIVhVYhlQKAqMtyx+zEMni/EkE7k
	Jd3vFn232PUoumjtXFj1fcRAiPdLdbRoYbVz6BEso1rWez6gXaJ4fiAQn4HPMDBD
	7j3Asd4I7nX5ioLmKXxQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c9djg12q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 24 Jan 2025 10:54:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50OAsnqb019280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 24 Jan 2025 10:54:49 GMT
Received: from [10.218.12.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 Jan
 2025 02:54:47 -0800
Content-Type: multipart/alternative;
	boundary="------------dBc6acCrtUwW8cz0i5efLrNP"
Message-ID: <5ae5f4b3-92de-4ea4-a4be-2f21f610cd46@quicinc.com>
Date: Fri, 24 Jan 2025 16:24:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <quic_janathot@quicinc.com>
From: Vivek Sahu <quic_vivesahu@quicinc.com>
Subject: QCA: Update firmware files for BT chip WCN6856
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8GR-rLoRgX1vyUjrIpx6xlJLYqgvWgo6
X-Proofpoint-ORIG-GUID: 8GR-rLoRgX1vyUjrIpx6xlJLYqgvWgo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=851 mlxscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240078

--------------dBc6acCrtUwW8cz0i5efLrNP
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know 
ifyou have any problems.

The following changes since commit 27ef6224c306b342c940dfafa1f5b3d060d96653:

   qca: Update Bluetooth WCN6856 firmware 2.1.0-00642 to 2.1.0-00650 
(2025-01-24 16:08:32 +0530)

   Merge branch 'parallel' into 'main'


are available in the Git repository at:

https://github.com/vivesahu-qcom/bt_hsp_fw650.git HEAD

for you to fetch changes up to 0ff5d85785fba6f7f23ecb57d36047bb3eb515ad:

   qca: Update Bluetooth WCN6856 firmware 2.1.0-00642 to 2.1.0-00650 
(2025-01-24 16:08:32 +0530)

----------------------------------------------------------------
Vivek Kumar Sahu (1):

qca: Update Bluetooth WCN6856 firmware 2.1.0-00642 to 2.1.0-00650
Thanks and regards,
Vivek K Sahu

--------------dBc6acCrtUwW8cz0i5efLrNP
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <p><span
style="color: rgb(36, 36, 36); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Hi
        linux-firmware maintainers,</span><br
style="color: rgb(36, 36, 36); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
      <br
style="color: rgb(36, 36, 36); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
      <span
style="color: rgb(36, 36, 36); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Here's
        a pull request for btqca bluetooth driver. Please let me know if</span><span
style="color: rgb(36, 36, 36); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
        you have any problems.</span></p>
    <p>The following changes since commit
      27ef6224c306b342c940dfafa1f5b3d060d96653:<br>
      <br>
        qca: Update Bluetooth WCN6856 firmware 2.1.0-00642 to
      2.1.0-00650 (2025-01-24 16:08:32 +0530)</p>
    <p><span data-olk-copy-source="MessageBody">  Merge branch
        'parallel' into 'main'</span></p>
    <p><br>
      are available in the Git repository at:<br>
      <br>
        <a class="moz-txt-link-freetext" href="https://github.com/vivesahu-qcom/bt_hsp_fw650.git">https://github.com/vivesahu-qcom/bt_hsp_fw650.git</a> HEAD<br>
      <br>
      for you to fetch changes up to
      0ff5d85785fba6f7f23ecb57d36047bb3eb515ad:<br>
      <br>
        qca: Update Bluetooth WCN6856 firmware 2.1.0-00642 to
      2.1.0-00650 (2025-01-24 16:08:32 +0530)<br>
    </p>
    <p><span
style="color: rgb(36, 36, 36); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">----------------------------------------------------------------</span><br
style="color: rgb(36, 36, 36); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
      <span
style="color: rgb(36, 36, 36); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Vivek
        Kumar Sahu (1):</span><span
class="Text__StyledText-sc-17v1xeu-0 hWqAbU ws-pre-wrap f5 wb-break-word text-mono"
style="box-sizing: border-box; font-size: 14px; word-break: break-word !important; overflow-wrap: break-word !important; font-family: var(--fontStack-monospace, ui-monospace, SFMono-Regular, SF Mono, Menlo, Consolas, Liberation Mono, monospace) !important; white-space: pre-wrap; color: rgb(31, 35, 40); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><div
      style="box-sizing: border-box;">    qca: Update Bluetooth WCN6856 firmware 2.1.0-00642 to 2.1.0-00650</div><div
      style="box-sizing: border-box;">
</div><div style="box-sizing: border-box;">Thanks and regards,</div><div
      style="box-sizing: border-box;">Vivek K Sahu
</div></span><br class="Apple-interchange-newline">
    </p>
  </body>
</html>

--------------dBc6acCrtUwW8cz0i5efLrNP--
