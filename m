Return-Path: <SRS0=v+9o=ZL=lenovo.com=markpearson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EC0C54EE9
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Sep 2022 15:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0268C433D7; Thu,  8 Sep 2022 15:48:15 +0000 (UTC)
Received: from mail1.bemta31.messagelabs.com (mail1.bemta31.messagelabs.com [67.219.246.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C394C433C1;
	Thu,  8 Sep 2022 15:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C394C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lenovo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lenovo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
	s=Selector; t=1662652093; i=@lenovo.com;
	bh=EcPAdYWF6zJ6/zNA6ilXEiHSDm3nwJJUq+sUAgG7eHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=CI5mBCOvVXEwIhWCAJcRjxQ1kNvv4tV9VJ+/0yh+juFlfYpSprd3IkmxbFAQ3pY3y
	 rfIHQgStBS9VXQO7I92mtYnPZeIqoEPxbutENJHVHIiEt9ZFcSS95nqF47569DipGX
	 /oWkXHA01iJ+ofhuu6YU+xAy+z4ygfzS+p7c49S1CfGfebbbD3ufCMwliRPbQtYJHP
	 BG9XUiTL37LJEjqakSX3msmViDjHQfNbKprXQ25miX4HLPLIGc1FChN+ch9XSAjU/7
	 Q7pEap1f5aiM8LycG99OwQeHZErVWJz23OJIbDulDQFDPl1JG3q4/tXU3gNRqciWoT
	 UB9IMIKliQpxA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHJsWRWlGSWpSXmKPExsWSoS+lr7ubTyr
  Z4MlMIYttHTYWE8//ZLM4sNzGgdlj06pONo871/awBTBFsWbmJeVXJLBmHPl9nrlgAmvFq6t7
  GRsYF7B0MXJxMAosZZY4deQUI4SziFXi1vGJUJlOJom+DyeYQRwhgTlMEnObv7NCOIeYJFauW
  MXUxcjJISFwnFGie5U7RKKTUWL31h9sIAkhgX4miYnP7CESjxklts66wgyReMgosedMbBcjBw
  evgK3ElI25IGEWARWJVY/PgQ3lFRCUODnzCQuILSoQKXGufT5Yq7BAoMSZCUfYQWxmAXGJW0/
  mg9WLCARIrLs7gxEiriVx/1YnI8QqJ4n/PR/AbDYBbYktW36B3cYp4CzRv+Q3M0S9pkTr9t9Q
  M+Ultr+dA3WmssSv/vPMEE8qSLzf1QL1cIJE85SjjBC2pMS1mxfYIWxZiaNn57CAvCUhYC+x5
  KEmRNhX4tOmP1Bj5CRO9Z6DGiMvsXPjbZYJjKqzkHw8C8lns5BcNwvJdQsYWVYxWiUVZaZnlO
  QmZuboGhoY6Boamuia6hoZmOslVukm6pUW66YmFpfoGuollhfrpRYX6xVX5ibnpOjlpZZsYgQ
  mn5Qi1vM7GJf3/NQ7xCjJwaQkyrt7oWSyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne6dxSyUKC
  RanpqRVpmTnARAiTluDgURLhvcoLlOYtLkjMLc5Mh0idYrTkuLJt715mjgcnTgLJa+sX7GMWY
  snLz0uVEufdAtIgANKQUZoHNw6WrC8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEua1BJnCk5
  lXArf1FdBBTEAHbQ0UBzmoJBEhJdXANOOUXOaz3eIXAv0dFm/zkX7doRohHaR56vWkmZMkSy5
  fmLHw6on/yqnralazyRmrM+mZXziV+cJohtnpnzWc3+O35KafuHbj8YXf/CzaPdctV/d4lm4s
  NHr9Q+fhM6VlWg9eXhHaoVJ69tmRv+6yrGvXODYrVD8xerH2scT0ByY9f1dO8Du3eM7+OhEnp
  xa7O2zSpos17/eoH1Z8V+K3TXeSVO4pCbNH27gjn15QSGnR/69wc+F+P5bXvz6w5KkISk11lV
  zt5aXx50LAj43PtP8djVDl77ug8dX0kO+TWTatX9uUr8R61sRLM1ranxWsZObp+XlWVdXhbq3
  zuroNtQ/2cUVvfyhyIPXfhMO7zJRYijMSDbWYi4oTARbD54BRBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-16.tower-686.messagelabs.com!1662652089!653712!1
X-Originating-IP: [104.47.26.47]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27980 invoked from network); 8 Sep 2022 15:48:11 -0000
Received: from mail-psaapc01lp2047.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.47)
  by server-16.tower-686.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Sep 2022 15:48:11 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGcfYDygQHK4XlobzaA4NGQp1/E/G4gwcXEfBEcykR4ixPJ2+HJ8aNKpvZ02o9vAK22Dhe/07iAO5HAPk/Bk6zz2J5BWXrrpxMzZE6Sp/pQR1xO9hdgoHvx10rehXQs01fF4LpS3zhlocKU4ed/6Tt8SWrXBrJ8LxpfTC/3z+TCs9+ViLk2QcrNV0F6y4im6Z991NKj8+GRB6426EYdFfn2NnoIJGQaPa/C6Mqf9k4zrqzr3BFN8GHevF9n6RaKPjOK1db0jpik98rTmNuiSPY9+D8C5OkESrnFJ9ZxlfNDRybZEBbHocjmlyg3ZcKNE0GIkW2g1wvtRzIWmsBvM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcPAdYWF6zJ6/zNA6ilXEiHSDm3nwJJUq+sUAgG7eHg=;
 b=FXQMq6D83O3TpY5XC0D1sNwLHInGLLZ6gakUl/DuT40lKv5mUwQWIHWT4mi3gQlUOtKxCvjUoMN30OkBzf9/9UKTcsAngEYgyDnyRHtT0kt9+jzLTksV2FbHME4vSTOCZgOhWcjgQ++2dGK7vW2ocMybfV1b337FasPJWKM5e/9RAvQdHqb6JE5h+agGf5VRCX729zKdez1cKunAG2OfBIUYn6rU5jJ/HzSKzSXFUwhq7rUjOx/KsVj0wlHwfvR94X171bL9q7zqzZ7++KXxW/Q3JfNha9wTkmTRfK9+iPU222xF7H5G1YzuH8bmQ96jSzG1GktCPcx5VYVlCzpvmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=linaro.org smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PS2PR06CA0002.apcprd06.prod.outlook.com (2603:1096:300:56::14)
 by SG2PR03MB2846.apcprd03.prod.outlook.com (2603:1096:3:1b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Thu, 8 Sep
 2022 15:48:08 +0000
Received: from PSAAPC01FT061.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:56:cafe::bc) by PS2PR06CA0002.outlook.office365.com
 (2603:1096:300:56::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Thu, 8 Sep 2022 15:48:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT061.mail.protection.outlook.com (10.13.38.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 15:48:06 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.31; Thu, 8 Sep
 2022 11:48:05 -0400
Received: from [10.38.61.212] (10.38.61.212) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.31; Thu, 8 Sep
 2022 11:48:04 -0400
Message-ID: <378be5b0-59e2-cfcf-84b5-b49ab01e86d5@lenovo.com>
Date: Thu, 8 Sep 2022 11:47:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [External] [PATCH] qcom: rename Lenovo ThinkPad X13s firmware
 paths
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	<linux-firmware@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>
References: <20220908143742.3362357-1-dmitry.baryshkov@linaro.org>
From: Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <20220908143742.3362357-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.61.212]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT061:EE_|SG2PR03MB2846:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e1e010-60e1-4576-0871-08da91b18644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qjBoy7Pj+2Cgdr7x4JaSLzx9Z84PF8RCRd6JNxVQfNZvRXPmIs26ZOSlfO71K63+HS+rQ+VrIPYvJ3RkRa50xCqsnNL4sbGtzc8E44hN7bcPdH884EkQrbAl/v/bpnS9OrenUB0ccTH5q3NK/cCuKUOQS36yDVaTsHZvX0fYGSjtSMpo2F4ypfUUSN9vn8k8mqKe/Em4WPrlNJo5THnN0DGDppVTcwSnSBA7fhgZ0bDbZhjp7BR6BfB7rSyec+CNKbYIZrYZRDNbHoO6UECdCjJc7oSmCB/a0TsYCj2a2ViWuOZpAOTZbCUjz9qvLRauWe7EkrlyfgQKjK7fmFXLSRFlVJHDsidY85UP8cpyaXAtuMiceuvowMnRpKfXXwi7BmRHGd4oA+Inir9vp0SCPLNOnGt7jq3qHH6kRRPyegv9AMdLnSudpl8IVYmOwqNA/nUjiBQ8HMWlgcBFYjWcEGvDCg7F+YupO5exNhouuLKHo3MnLDK9BjnfrZxYKescymJeZN5wkuNCWcP+2inI8IfokQnTy5QIAexkUXfVxmYqWgOSzHvfCSlUzRhMaLT7vUe6OC+atq1tjceRY/j7uW2jHQ3Oxh27+RKiHgMryGyAmW8ErdUh7IjHNw7K2qkYcwzF8SDYzoMbEPRxd7S7xrYIclt36nveCQ+glFGRebXMPldRTpCEPNReNIPOYdBJ2N0YXaQeFMQMEz8D6Dr2SwvbmTGEzTIdJ7KDv3Hfvxg6s064Noymh4fEK/clapSPb+OgGd0hEvkT6L/LECoboarMJXpakmqdhX5IiiH3XnoQ5Wd8MQ9IpKeuTgkY8VHymhD7A+RIOmMbdiF/uwtX51+Cqf/a8XIgPKVgkGYCE903KoKlxA7N+xKPqOy6x9mRBzNiv9RwOvZkgy5HSzq4fXPCdW8STTymhEWdClMSvIg=
X-Forefront-Antispam-Report:
	CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966006)(36840700001)(40470700004)(186003)(36756003)(336012)(5660300002)(4744005)(2906002)(110136005)(53546011)(40480700001)(2616005)(41300700001)(6666004)(26005)(31686004)(86362001)(31696002)(426003)(47076005)(8936002)(16526019)(478600001)(70586007)(356005)(82740400003)(81166007)(4326008)(16576012)(82310400005)(316002)(36906005)(70206006)(8676002)(36860700001)(40460700003)(82960400001)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB2846


On 2022-09-08 10:37, Dmitry Baryshkov wrote:
> After some discussion with Bjorn, the Qualcomm platform maintainer, it
> was agreed to follow the established practice and to inject the SoC name
> into the firmware paths.
> 
> It is highly unlikely that we are going to run Linux off the existing
> ACPI data in these platforms anytime soon. And even if we do so, we'd
> have to figure out the file names anyway, as they do not follow the
> existing standard names.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Mark Pearson <markpearson@lenovo.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

No concerns from me.
Thanks!
Mark

